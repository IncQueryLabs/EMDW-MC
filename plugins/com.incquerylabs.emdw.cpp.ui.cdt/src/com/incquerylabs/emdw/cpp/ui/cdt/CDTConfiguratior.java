/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Tamas Borbas - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.ui.cdt;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.cdt.core.CCProjectNature;
import org.eclipse.cdt.core.CProjectNature;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.IProjectDescription;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.cdt.core.model.CoreModel;
import org.eclipse.cdt.core.settings.model.ICProjectDescription;
import org.eclipse.cdt.managedbuilder.buildproperties.IBuildPropertyValue;
import org.eclipse.cdt.managedbuilder.core.BuildException;
import org.eclipse.cdt.managedbuilder.core.IBuilder;
import org.eclipse.cdt.managedbuilder.core.IConfiguration;
import org.eclipse.cdt.managedbuilder.core.IManagedProject;
import org.eclipse.cdt.managedbuilder.core.IToolChain;
import org.eclipse.cdt.managedbuilder.core.ManagedBuildManager;

public class CDTConfiguratior {
    
    public static boolean hasCDTNature(IProject project) throws CoreException {
        IProjectDescription description = project.getDescription();
        String[] natures = description.getNatureIds();
        for (String nature : natures) {
            if (CProjectNature.C_NATURE_ID.equals(nature) || CCProjectNature.CC_NATURE_ID.equals(nature)) {
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
