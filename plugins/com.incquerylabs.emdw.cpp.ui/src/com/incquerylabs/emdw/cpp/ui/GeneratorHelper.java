package com.incquerylabs.emdw.cpp.ui;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.Adler32;

import org.eclipse.cdt.core.CCProjectNature;
import org.eclipse.cdt.core.CProjectNature;
import org.eclipse.cdt.core.model.CoreModel;
import org.eclipse.cdt.core.settings.model.ICProjectDescription;
import org.eclipse.cdt.managedbuilder.buildproperties.IBuildPropertyValue;
import org.eclipse.cdt.managedbuilder.core.BuildException;
import org.eclipse.cdt.managedbuilder.core.IBuilder;
import org.eclipse.cdt.managedbuilder.core.IConfiguration;
import org.eclipse.cdt.managedbuilder.core.IManagedProject;
import org.eclipse.cdt.managedbuilder.core.IToolChain;
import org.eclipse.cdt.managedbuilder.core.ManagedBuildManager;
import org.eclipse.core.resources.IContainer;
import org.eclipse.core.resources.IFile;
import org.eclipse.core.resources.IFolder;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.IProjectDescription;
import org.eclipse.core.resources.IResource;
import org.eclipse.core.resources.IWorkspace;
import org.eclipse.core.resources.IWorkspaceRoot;
import org.eclipse.core.resources.ResourcesPlugin;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.NullProgressMonitor;
import org.eclipse.core.runtime.Path;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.papyrusrt.xtumlrt.common.Model;

import com.google.common.io.Files;

/**
 * A helper class with static methods for file and folder creation for the
 * templates.
 * 
 */
public class GeneratorHelper {
	
	private final static String generationDirectoryName = "src";
	private final static String generationProjectPrefix = "com.ericsson.emdw.cpp.generated.code.";
	
	/**
	 * Creates a file into the project that the parameter
	 * <code>nextTo</code> is in. The file is placed into the folder named
	 * <code>src</code>, which is expected to be exist. It creates the folder
	 * composition from the namespace hiearchy, so for example the namespace
	 * <code>hu.bme.mit.jpadatagenerator.helper</code> creates the
	 * <code>src/hu/bme/mit/jpadatagenerator/helper</code> folder if it isn't
	 * existed previously. The java file named <code>&lt;name&gt;.java</code>
	 * will be placed into this folder with the content defined by the
	 * <code>content</code> parameter, where <code>&lt;name&gt;</code> comes
	 * from the parameter <code>name</code>. The method only replaces a derived
	 * file.
	 * 
	 * @param nextTo
	 *            A resource which defines the target project of the file
	 *            creation.
	 * @param namespace
	 *            The namespace of the new java document.
	 * @param name
	 *            The name of the new java document and the new file.
	 * @param derived
	 *            The derived property of the new file.
	 * @param content
	 *            The content of the new file.
	 * @return Returns with the created file.
	 * @throws CoreException
	 *             If the folder named src doesn't exists or one of the folder
	 *             or the java file itself can not be created.
	 * @throws IOException 
	 * @throws BuildException 
	 */
	public static IFile createFileNextToWorkspaceResource(Resource nextTo, String name,
			Boolean derived, CharSequence content) throws CoreException, IOException, BuildException {
		IFolder targetFolder = getTargetFolder(nextTo, true);
		// At the end a new file is created in the target folder.
		return createFile(targetFolder, name, derived, content, false);
	}
	
	public static IFolder getTargetFolder(Resource resource, boolean nextToWorkspaceResource) throws CoreException, IOException, BuildException {
		IWorkspaceRoot workspaceRoot = ResourcesPlugin.getWorkspace().getRoot();
		URI resourceUri = resource.getURI();
		IFile resourceFile = workspaceRoot.getFile(new Path(resourceUri.toPlatformString(true)));
		IContainer parent;
		if(resourceFile != null){
		    if(nextToWorkspaceResource) {
		        parent = resourceFile.getParent();
		    } else {
		        String name = resourceFile.getName();
		        EObject object = resource.getContents().get(0);
		        if(object instanceof Model) {
		            name = ((Model)object).getName();
		        }
		        parent = getOrCreateProject(generationProjectPrefix+name);
		    }
		} else {
			parent = getOrCreateProject(generationProjectPrefix);
		}
		IFolder targetFolder = null;
		if(parent instanceof IFolder){
			IFolder resourceFolder = (IFolder) parent;
			targetFolder = getOrCreateFolder(resourceFolder, generationDirectoryName);
		} else if (parent instanceof IProject){
			targetFolder = getOrCreateFolder((IProject) parent, generationDirectoryName);
		}
		return targetFolder;
	}
	
	private static IFolder getOrCreateFolder(IProject project, String folderName)
			throws CoreException {
		IFolder folder = project.getFolder(folderName);
		// If the folder doesn't exists create it.
		if (!folder.exists()) {
			IProgressMonitor monitor = new NullProgressMonitor();
			folder.create(true, true, monitor);
		}
		return folder;
	}

	/**
	 * Returns a folder with the same name as <code>newFolder</code> located in
	 * <code>newFolder</code>. The function create such folder if it is
	 * necessary.
	 * 
	 * @param container
	 *            The container folder.
	 * @param newFolder
	 *            The name of the folder needed.
	 * @return A folder in the <code>container</code> named
	 *         <code>newFolder</code>.
	 * @throws CoreException
	 *             If the folder can not be created.
	 */
	public static IFolder getOrCreateFolder(IFolder container, String newFolder)
			throws CoreException {
		// Referring a folder by a relative name.
		IFolder folder = container.getFolder(newFolder);

		// If the folder doesn't exists create it.
		if (!folder.exists()) {
			IProgressMonitor monitor = new NullProgressMonitor();
			folder.create(true, true, monitor);
		}

		// Return with the folder.
		return folder;
	}

	/**
	 * Creates a file named <code>name</code> into the folder
	 * <code>folder</code>with the content <code>content</code> and sets the
	 * derived. It overwrites only derived files and it doesn't delete anything
	 * editable by the user.
	 * 
	 * @param folder
	 *            The target folder.
	 * @param name
	 *            The name of the new file.
	 * @param derived
	 *            The derived property of the new file.
	 * @param content
	 *            The content of the new file.
	 * @param forceReCreate TODO
	 * @return The new file.
	 * @throws CoreException
	 *             If an existing file can not be deleted, the new file can not
	 *             be created or the derived property can not be set.
	 * @throws IOException 
	 */
	public static IFile createFile(IFolder folder, String name,
			boolean derived, CharSequence content, boolean forceReCreate) throws CoreException, IOException {
		// Referring a file by a relative name.
		IFile file = folder.getFile(name);

		// If the file existed before, and it is not editable, it should be
		// deleted
		IProgressMonitor monitor = new NullProgressMonitor();
		// If the file existed before check the content
		if(file.exists()){
			long fileCheckSum = calculateFileCheckSum(file);
			long contentCheckSum = calculateCharSequenceCheckSum(content);
			// Same content do not write again!
			if(fileCheckSum == contentCheckSum){
				return file;
			}
		}
		
		// Derived file that has to be overwritten can be deleted
		if (file.exists() && file.isDerived()) {
			file.delete(true, monitor);
		}

		// Force re-creation of user editable file
		if(file.exists() && forceReCreate){
			file.delete(true, monitor);
		}
		
		if(!file.exists()){
			// Create the file if it is to exists.
			file.create(
					new ByteArrayInputStream(content.toString().getBytes()),
					true, monitor);

			// Setting the properties of the file.
			if (derived) {
				file.setDerived(true, monitor);
			}
		}
		
		// Return with the file.
		return file;
	}

	public static long calculateCharSequenceCheckSum(CharSequence content) {
		byte[] byteArray = new byte[content.length()];
		for(int i = 0; i < content.length(); i++){
			byteArray[i] = (byte) content.charAt(i);
		}
		return calculateCheckSum(byteArray);
	}

	public static long calculateFileCheckSum(IFile file) throws IOException {
		return calculateFileCheckSum(file.getRawLocation().makeAbsolute().toFile());
	}
	
	public static long calculateFileCheckSum(File file) throws IOException {
		byte[] fileByteArray = Files.toByteArray(file);
		return calculateCheckSum(fileByteArray);
	}

	public static long calculateCheckSum(byte[] byteArray) {
		Adler32 a32 = new Adler32();
		a32.update(byteArray);
		return a32.getValue();
	}

	public static IProject getOrCreateProject(String name) throws CoreException, BuildException {
        // Referring a project in the workspace by it's name
        IWorkspace workspace = ResourcesPlugin.getWorkspace();
        IProject project = workspace.getRoot().getProject(name);

        // If the project is not exist it will be created.
        IProgressMonitor monitor = new NullProgressMonitor();
        boolean isProjectExist = project.exists();
        if (!isProjectExist) {
            project.create(monitor);
        }

        // The project should be opened.
        project.open(IResource.BACKGROUND_REFRESH, monitor);

        if(!hasCDTNature(project)) {
            setupCDT(project, monitor);
        }
        
        return project;
	 }

    public static boolean hasCDTNature(IProject project) throws CoreException {
        IProjectDescription description = project.getDescription();
        String[] natures = description.getNatureIds();
        for (String nature : natures) {
            if (CProjectNature.C_NATURE_ID.equals(nature) || 
                    CCProjectNature.CC_NATURE_ID.equals(nature)) {
                return true;
            }
        }
        return false;
    }

    public static void setupCDT(IProject project, IProgressMonitor monitor) throws CoreException, BuildException {
        List<IConfiguration> cfgs = new ArrayList<IConfiguration>();
        for (IConfiguration cfg : ManagedBuildManager.getExtensionConfigurations()) {
            IToolChain tc = cfg.getToolChain();
            if (tc != null && ManagedBuildManager.isPlatformOk(tc) && tc.isSupported()) {
                IBuildPropertyValue value = cfg.getBuildArtefactType();
                if (value != null) {
                    if (ManagedBuildManager.BUILD_ARTEFACT_TYPE_PROPERTY_EXE.equals(value.getId())) {
                        cfgs.add(cfg);
                    }
                }
            }
        }

        CProjectNature.addCNature(project, monitor);
        CCProjectNature.addCCNature(project, monitor);
        ICProjectDescription des = CoreModel.getDefault().createProjectDescription(project, false);

        // create build info and managed project
        IConfiguration cfg = cfgs.get(0);
        ManagedBuildManager.createBuildInfo(project);
        IManagedProject mProj = ManagedBuildManager.createManagedProject(project, cfg.getProjectType());

        for (IConfiguration icf : cfgs) {
            String id = ManagedBuildManager.calculateChildId(icf.getId(), null);

            // clone the configuration and set the artifact name
            IConfiguration config = mProj.createConfiguration(icf, id);
            config.setArtifactName("${ProjName}");

            // creates/add the configuration to the project description
            des.createConfiguration(ManagedBuildManager.CFG_DATA_PROVIDER_ID, config.getConfigurationData());

            // set the builder to "managed" mode
            IBuilder bld = config.getEditableBuilder();
            if (bld != null) {
                bld.setManagedBuildOn(true);
            }
        }

        CoreModel.getDefault().setProjectDescription(project, des);
    }
}
