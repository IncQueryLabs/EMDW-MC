/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.BaseContainerImplementation;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import java.lang.reflect.InvocationTargetException;

import java.util.Collection;
import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;
import org.eclipse.emf.ecore.util.EDataTypeUniqueEList;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Base Container Implementation</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getAnyTemplate <em>Any Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getAddTemplate <em>Add Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getAddAllTemplate <em>Add All Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getClearTemplate <em>Clear Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getCloneTemplate <em>Clone Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getContainsTemplate <em>Contains Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getContainsAllTemplate <em>Contains All Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getCountOfTemplate <em>Count Of Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getElementAtIndexTemplate <em>Element At Index Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getInsertElementAtIndexTemplate <em>Insert Element At Index Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getIsEmptyTemplate <em>Is Empty Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getRemoveTemplate <em>Remove Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getRemoveAllTemplate <em>Remove All Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getReplaceElementAtIndexTemplate <em>Replace Element At Index Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getRetainAllTemplate <em>Retain All Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getSizeTemplate <em>Size Template</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getContainerQualifiedName <em>Container Qualified Name</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl#getContainerHeaderIncludes <em>Container Header Includes</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class BaseContainerImplementationImpl extends MinimalEObjectImpl.Container implements BaseContainerImplementation {
    /**
     * The default value of the '{@link #getAnyTemplate() <em>Any Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getAnyTemplate()
     * @generated
     * @ordered
     */
    protected static final String ANY_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getAnyTemplate() <em>Any Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getAnyTemplate()
     * @generated
     * @ordered
     */
    protected String anyTemplate = ANY_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getAddTemplate() <em>Add Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getAddTemplate()
     * @generated
     * @ordered
     */
    protected static final String ADD_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getAddTemplate() <em>Add Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getAddTemplate()
     * @generated
     * @ordered
     */
    protected String addTemplate = ADD_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getAddAllTemplate() <em>Add All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getAddAllTemplate()
     * @generated
     * @ordered
     */
    protected static final String ADD_ALL_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getAddAllTemplate() <em>Add All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getAddAllTemplate()
     * @generated
     * @ordered
     */
    protected String addAllTemplate = ADD_ALL_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getClearTemplate() <em>Clear Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getClearTemplate()
     * @generated
     * @ordered
     */
    protected static final String CLEAR_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getClearTemplate() <em>Clear Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getClearTemplate()
     * @generated
     * @ordered
     */
    protected String clearTemplate = CLEAR_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getCloneTemplate() <em>Clone Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getCloneTemplate()
     * @generated
     * @ordered
     */
    protected static final String CLONE_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getCloneTemplate() <em>Clone Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getCloneTemplate()
     * @generated
     * @ordered
     */
    protected String cloneTemplate = CLONE_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getContainsTemplate() <em>Contains Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getContainsTemplate()
     * @generated
     * @ordered
     */
    protected static final String CONTAINS_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getContainsTemplate() <em>Contains Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getContainsTemplate()
     * @generated
     * @ordered
     */
    protected String containsTemplate = CONTAINS_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getContainsAllTemplate() <em>Contains All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getContainsAllTemplate()
     * @generated
     * @ordered
     */
    protected static final String CONTAINS_ALL_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getContainsAllTemplate() <em>Contains All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getContainsAllTemplate()
     * @generated
     * @ordered
     */
    protected String containsAllTemplate = CONTAINS_ALL_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getCountOfTemplate() <em>Count Of Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getCountOfTemplate()
     * @generated
     * @ordered
     */
    protected static final String COUNT_OF_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getCountOfTemplate() <em>Count Of Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getCountOfTemplate()
     * @generated
     * @ordered
     */
    protected String countOfTemplate = COUNT_OF_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getElementAtIndexTemplate() <em>Element At Index Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getElementAtIndexTemplate()
     * @generated
     * @ordered
     */
    protected static final String ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getElementAtIndexTemplate() <em>Element At Index Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getElementAtIndexTemplate()
     * @generated
     * @ordered
     */
    protected String elementAtIndexTemplate = ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getInsertElementAtIndexTemplate() <em>Insert Element At Index Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getInsertElementAtIndexTemplate()
     * @generated
     * @ordered
     */
    protected static final String INSERT_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getInsertElementAtIndexTemplate() <em>Insert Element At Index Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getInsertElementAtIndexTemplate()
     * @generated
     * @ordered
     */
    protected String insertElementAtIndexTemplate = INSERT_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getIsEmptyTemplate() <em>Is Empty Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getIsEmptyTemplate()
     * @generated
     * @ordered
     */
    protected static final String IS_EMPTY_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getIsEmptyTemplate() <em>Is Empty Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getIsEmptyTemplate()
     * @generated
     * @ordered
     */
    protected String isEmptyTemplate = IS_EMPTY_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getRemoveTemplate() <em>Remove Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getRemoveTemplate()
     * @generated
     * @ordered
     */
    protected static final String REMOVE_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getRemoveTemplate() <em>Remove Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getRemoveTemplate()
     * @generated
     * @ordered
     */
    protected String removeTemplate = REMOVE_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getRemoveAllTemplate() <em>Remove All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getRemoveAllTemplate()
     * @generated
     * @ordered
     */
    protected static final String REMOVE_ALL_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getRemoveAllTemplate() <em>Remove All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getRemoveAllTemplate()
     * @generated
     * @ordered
     */
    protected String removeAllTemplate = REMOVE_ALL_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getReplaceElementAtIndexTemplate() <em>Replace Element At Index Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getReplaceElementAtIndexTemplate()
     * @generated
     * @ordered
     */
    protected static final String REPLACE_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getReplaceElementAtIndexTemplate() <em>Replace Element At Index Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getReplaceElementAtIndexTemplate()
     * @generated
     * @ordered
     */
    protected String replaceElementAtIndexTemplate = REPLACE_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getRetainAllTemplate() <em>Retain All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getRetainAllTemplate()
     * @generated
     * @ordered
     */
    protected static final String RETAIN_ALL_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getRetainAllTemplate() <em>Retain All Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getRetainAllTemplate()
     * @generated
     * @ordered
     */
    protected String retainAllTemplate = RETAIN_ALL_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getSizeTemplate() <em>Size Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getSizeTemplate()
     * @generated
     * @ordered
     */
    protected static final String SIZE_TEMPLATE_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getSizeTemplate() <em>Size Template</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getSizeTemplate()
     * @generated
     * @ordered
     */
    protected String sizeTemplate = SIZE_TEMPLATE_EDEFAULT;

    /**
     * The default value of the '{@link #getContainerQualifiedName() <em>Container Qualified Name</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getContainerQualifiedName()
     * @generated
     * @ordered
     */
    protected static final String CONTAINER_QUALIFIED_NAME_EDEFAULT = null;

    /**
     * The cached value of the '{@link #getContainerQualifiedName() <em>Container Qualified Name</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getContainerQualifiedName()
     * @generated
     * @ordered
     */
    protected String containerQualifiedName = CONTAINER_QUALIFIED_NAME_EDEFAULT;

    /**
     * The cached value of the '{@link #getContainerHeaderIncludes() <em>Container Header Includes</em>}' attribute list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getContainerHeaderIncludes()
     * @generated
     * @ordered
     */
    protected EList<String> containerHeaderIncludes;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected BaseContainerImplementationImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.BASE_CONTAINER_IMPLEMENTATION;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getAnyTemplate() {
        return anyTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setAnyTemplate(String newAnyTemplate) {
        String oldAnyTemplate = anyTemplate;
        anyTemplate = newAnyTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE, oldAnyTemplate, anyTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getAddTemplate() {
        return addTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setAddTemplate(String newAddTemplate) {
        String oldAddTemplate = addTemplate;
        addTemplate = newAddTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE, oldAddTemplate, addTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getAddAllTemplate() {
        return addAllTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setAddAllTemplate(String newAddAllTemplate) {
        String oldAddAllTemplate = addAllTemplate;
        addAllTemplate = newAddAllTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE, oldAddAllTemplate, addAllTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getClearTemplate() {
        return clearTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setClearTemplate(String newClearTemplate) {
        String oldClearTemplate = clearTemplate;
        clearTemplate = newClearTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE, oldClearTemplate, clearTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getCloneTemplate() {
        return cloneTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setCloneTemplate(String newCloneTemplate) {
        String oldCloneTemplate = cloneTemplate;
        cloneTemplate = newCloneTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE, oldCloneTemplate, cloneTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getContainsTemplate() {
        return containsTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setContainsTemplate(String newContainsTemplate) {
        String oldContainsTemplate = containsTemplate;
        containsTemplate = newContainsTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE, oldContainsTemplate, containsTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getContainsAllTemplate() {
        return containsAllTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setContainsAllTemplate(String newContainsAllTemplate) {
        String oldContainsAllTemplate = containsAllTemplate;
        containsAllTemplate = newContainsAllTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE, oldContainsAllTemplate, containsAllTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getCountOfTemplate() {
        return countOfTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setCountOfTemplate(String newCountOfTemplate) {
        String oldCountOfTemplate = countOfTemplate;
        countOfTemplate = newCountOfTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE, oldCountOfTemplate, countOfTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getElementAtIndexTemplate() {
        return elementAtIndexTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setElementAtIndexTemplate(String newElementAtIndexTemplate) {
        String oldElementAtIndexTemplate = elementAtIndexTemplate;
        elementAtIndexTemplate = newElementAtIndexTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE, oldElementAtIndexTemplate, elementAtIndexTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getInsertElementAtIndexTemplate() {
        return insertElementAtIndexTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setInsertElementAtIndexTemplate(String newInsertElementAtIndexTemplate) {
        String oldInsertElementAtIndexTemplate = insertElementAtIndexTemplate;
        insertElementAtIndexTemplate = newInsertElementAtIndexTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE, oldInsertElementAtIndexTemplate, insertElementAtIndexTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getIsEmptyTemplate() {
        return isEmptyTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setIsEmptyTemplate(String newIsEmptyTemplate) {
        String oldIsEmptyTemplate = isEmptyTemplate;
        isEmptyTemplate = newIsEmptyTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE, oldIsEmptyTemplate, isEmptyTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getRemoveTemplate() {
        return removeTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setRemoveTemplate(String newRemoveTemplate) {
        String oldRemoveTemplate = removeTemplate;
        removeTemplate = newRemoveTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE, oldRemoveTemplate, removeTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getRemoveAllTemplate() {
        return removeAllTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setRemoveAllTemplate(String newRemoveAllTemplate) {
        String oldRemoveAllTemplate = removeAllTemplate;
        removeAllTemplate = newRemoveAllTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE, oldRemoveAllTemplate, removeAllTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getReplaceElementAtIndexTemplate() {
        return replaceElementAtIndexTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setReplaceElementAtIndexTemplate(String newReplaceElementAtIndexTemplate) {
        String oldReplaceElementAtIndexTemplate = replaceElementAtIndexTemplate;
        replaceElementAtIndexTemplate = newReplaceElementAtIndexTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE, oldReplaceElementAtIndexTemplate, replaceElementAtIndexTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getRetainAllTemplate() {
        return retainAllTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setRetainAllTemplate(String newRetainAllTemplate) {
        String oldRetainAllTemplate = retainAllTemplate;
        retainAllTemplate = newRetainAllTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE, oldRetainAllTemplate, retainAllTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getSizeTemplate() {
        return sizeTemplate;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setSizeTemplate(String newSizeTemplate) {
        String oldSizeTemplate = sizeTemplate;
        sizeTemplate = newSizeTemplate;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE, oldSizeTemplate, sizeTemplate));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getContainerQualifiedName() {
        return containerQualifiedName;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setContainerQualifiedName(String newContainerQualifiedName) {
        String oldContainerQualifiedName = containerQualifiedName;
        containerQualifiedName = newContainerQualifiedName;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME, oldContainerQualifiedName, containerQualifiedName));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EList<String> getContainerHeaderIncludes() {
        if (containerHeaderIncludes == null) {
            containerHeaderIncludes = new EDataTypeUniqueEList<String>(String.class, this, OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES);
        }
        return containerHeaderIncludes;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateAdd(final String collection, final String value, final String result) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateAdd(this, collection, value, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateAddAll(final String collection, final String values) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateAddAll(this, collection, values);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateClear(final String collection) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateClear(this, collection);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateClone(final String collection, final String valueType, final String result) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateClone(this, collection, valueType, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateContains(final String collection, final String value, final String result) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateContains(this, collection, value, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateContainsAll(final String collection, final String values, final String valuesType, final String valueType, final String result) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateContainsAll(this, collection, values, valuesType, valueType, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateIsEmpty(final String collection, final String result) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateIsEmpty(this, collection, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateRemove(final String collection, final String value) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateRemove(this, collection, value);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateRemoveAll(final String collection, final String values, final String valuesType, final String valueType) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateRemoveAll(this, collection, values, valuesType, valueType);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateRetainAll(final String collection, final String values, final String valueType) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateRetainAll(this, collection, values, valueType);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateSize(final String collection, final String result) {
        String template = com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer.generateSize(this, collection, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE:
                return getAnyTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE:
                return getAddTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE:
                return getAddAllTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE:
                return getClearTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE:
                return getCloneTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE:
                return getContainsTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE:
                return getContainsAllTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE:
                return getCountOfTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE:
                return getElementAtIndexTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE:
                return getInsertElementAtIndexTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE:
                return getIsEmptyTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE:
                return getRemoveTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE:
                return getRemoveAllTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE:
                return getReplaceElementAtIndexTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE:
                return getRetainAllTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE:
                return getSizeTemplate();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME:
                return getContainerQualifiedName();
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES:
                return getContainerHeaderIncludes();
        }
        return super.eGet(featureID, resolve, coreType);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @SuppressWarnings("unchecked")
    @Override
    public void eSet(int featureID, Object newValue) {
        switch (featureID) {
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE:
                setAnyTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE:
                setAddTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE:
                setAddAllTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE:
                setClearTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE:
                setCloneTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE:
                setContainsTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE:
                setContainsAllTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE:
                setCountOfTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE:
                setElementAtIndexTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE:
                setInsertElementAtIndexTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE:
                setIsEmptyTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE:
                setRemoveTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE:
                setRemoveAllTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE:
                setReplaceElementAtIndexTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE:
                setRetainAllTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE:
                setSizeTemplate((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME:
                setContainerQualifiedName((String)newValue);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES:
                getContainerHeaderIncludes().clear();
                getContainerHeaderIncludes().addAll((Collection<? extends String>)newValue);
                return;
        }
        super.eSet(featureID, newValue);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public void eUnset(int featureID) {
        switch (featureID) {
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE:
                setAnyTemplate(ANY_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE:
                setAddTemplate(ADD_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE:
                setAddAllTemplate(ADD_ALL_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE:
                setClearTemplate(CLEAR_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE:
                setCloneTemplate(CLONE_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE:
                setContainsTemplate(CONTAINS_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE:
                setContainsAllTemplate(CONTAINS_ALL_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE:
                setCountOfTemplate(COUNT_OF_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE:
                setElementAtIndexTemplate(ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE:
                setInsertElementAtIndexTemplate(INSERT_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE:
                setIsEmptyTemplate(IS_EMPTY_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE:
                setRemoveTemplate(REMOVE_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE:
                setRemoveAllTemplate(REMOVE_ALL_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE:
                setReplaceElementAtIndexTemplate(REPLACE_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE:
                setRetainAllTemplate(RETAIN_ALL_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE:
                setSizeTemplate(SIZE_TEMPLATE_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME:
                setContainerQualifiedName(CONTAINER_QUALIFIED_NAME_EDEFAULT);
                return;
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES:
                getContainerHeaderIncludes().clear();
                return;
        }
        super.eUnset(featureID);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public boolean eIsSet(int featureID) {
        switch (featureID) {
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE:
                return ANY_TEMPLATE_EDEFAULT == null ? anyTemplate != null : !ANY_TEMPLATE_EDEFAULT.equals(anyTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE:
                return ADD_TEMPLATE_EDEFAULT == null ? addTemplate != null : !ADD_TEMPLATE_EDEFAULT.equals(addTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE:
                return ADD_ALL_TEMPLATE_EDEFAULT == null ? addAllTemplate != null : !ADD_ALL_TEMPLATE_EDEFAULT.equals(addAllTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE:
                return CLEAR_TEMPLATE_EDEFAULT == null ? clearTemplate != null : !CLEAR_TEMPLATE_EDEFAULT.equals(clearTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE:
                return CLONE_TEMPLATE_EDEFAULT == null ? cloneTemplate != null : !CLONE_TEMPLATE_EDEFAULT.equals(cloneTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE:
                return CONTAINS_TEMPLATE_EDEFAULT == null ? containsTemplate != null : !CONTAINS_TEMPLATE_EDEFAULT.equals(containsTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE:
                return CONTAINS_ALL_TEMPLATE_EDEFAULT == null ? containsAllTemplate != null : !CONTAINS_ALL_TEMPLATE_EDEFAULT.equals(containsAllTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE:
                return COUNT_OF_TEMPLATE_EDEFAULT == null ? countOfTemplate != null : !COUNT_OF_TEMPLATE_EDEFAULT.equals(countOfTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE:
                return ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT == null ? elementAtIndexTemplate != null : !ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT.equals(elementAtIndexTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE:
                return INSERT_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT == null ? insertElementAtIndexTemplate != null : !INSERT_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT.equals(insertElementAtIndexTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE:
                return IS_EMPTY_TEMPLATE_EDEFAULT == null ? isEmptyTemplate != null : !IS_EMPTY_TEMPLATE_EDEFAULT.equals(isEmptyTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE:
                return REMOVE_TEMPLATE_EDEFAULT == null ? removeTemplate != null : !REMOVE_TEMPLATE_EDEFAULT.equals(removeTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE:
                return REMOVE_ALL_TEMPLATE_EDEFAULT == null ? removeAllTemplate != null : !REMOVE_ALL_TEMPLATE_EDEFAULT.equals(removeAllTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE:
                return REPLACE_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT == null ? replaceElementAtIndexTemplate != null : !REPLACE_ELEMENT_AT_INDEX_TEMPLATE_EDEFAULT.equals(replaceElementAtIndexTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE:
                return RETAIN_ALL_TEMPLATE_EDEFAULT == null ? retainAllTemplate != null : !RETAIN_ALL_TEMPLATE_EDEFAULT.equals(retainAllTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE:
                return SIZE_TEMPLATE_EDEFAULT == null ? sizeTemplate != null : !SIZE_TEMPLATE_EDEFAULT.equals(sizeTemplate);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME:
                return CONTAINER_QUALIFIED_NAME_EDEFAULT == null ? containerQualifiedName != null : !CONTAINER_QUALIFIED_NAME_EDEFAULT.equals(containerQualifiedName);
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES:
                return containerHeaderIncludes != null && !containerHeaderIncludes.isEmpty();
        }
        return super.eIsSet(featureID);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eInvoke(int operationID, EList<?> arguments) throws InvocationTargetException {
        switch (operationID) {
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING:
                return generateAdd((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING:
                return generateAddAll((String)arguments.get(0), (String)arguments.get(1));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLEAR__STRING:
                return generateClear((String)arguments.get(0));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING:
                return generateClone((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING:
                return generateContains((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING:
                return generateContainsAll((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2), (String)arguments.get(3), (String)arguments.get(4));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING:
                return generateIsEmpty((String)arguments.get(0), (String)arguments.get(1));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING:
                return generateRemove((String)arguments.get(0), (String)arguments.get(1));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING:
                return generateRemoveAll((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2), (String)arguments.get(3));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING:
                return generateRetainAll((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2));
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING:
                return generateSize((String)arguments.get(0), (String)arguments.get(1));
        }
        return super.eInvoke(operationID, arguments);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public String toString() {
        if (eIsProxy()) return super.toString();

        StringBuffer result = new StringBuffer(super.toString());
        result.append(" (anyTemplate: ");
        result.append(anyTemplate);
        result.append(", addTemplate: ");
        result.append(addTemplate);
        result.append(", addAllTemplate: ");
        result.append(addAllTemplate);
        result.append(", clearTemplate: ");
        result.append(clearTemplate);
        result.append(", cloneTemplate: ");
        result.append(cloneTemplate);
        result.append(", containsTemplate: ");
        result.append(containsTemplate);
        result.append(", containsAllTemplate: ");
        result.append(containsAllTemplate);
        result.append(", countOfTemplate: ");
        result.append(countOfTemplate);
        result.append(", elementAtIndexTemplate: ");
        result.append(elementAtIndexTemplate);
        result.append(", insertElementAtIndexTemplate: ");
        result.append(insertElementAtIndexTemplate);
        result.append(", isEmptyTemplate: ");
        result.append(isEmptyTemplate);
        result.append(", removeTemplate: ");
        result.append(removeTemplate);
        result.append(", removeAllTemplate: ");
        result.append(removeAllTemplate);
        result.append(", replaceElementAtIndexTemplate: ");
        result.append(replaceElementAtIndexTemplate);
        result.append(", retainAllTemplate: ");
        result.append(retainAllTemplate);
        result.append(", sizeTemplate: ");
        result.append(sizeTemplate);
        result.append(", containerQualifiedName: ");
        result.append(containerQualifiedName);
        result.append(", containerHeaderIncludes: ");
        result.append(containerHeaderIncludes);
        result.append(')');
        return result.toString();
    }

} //BaseContainerImplementationImpl
