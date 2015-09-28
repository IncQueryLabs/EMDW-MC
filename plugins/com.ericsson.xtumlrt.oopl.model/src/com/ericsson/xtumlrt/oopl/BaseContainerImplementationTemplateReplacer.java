package com.ericsson.xtumlrt.oopl;

import java.util.Map;
import java.util.Map.Entry;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor;
import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor;
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor;

public class BaseContainerImplementationTemplateReplacer {
    protected static String generateTemplate(String template, Map<String, String> map) {
        for(Entry<String, String> entry : map.entrySet()) {
            template = template.replace(entry.getKey(), entry.getValue());
        }
        return template;
    }
    
    
    /**************************************************
     * 
     * BaseContainerImplementation templates
     * 
     **************************************************/
    
    public static String generateAdd(BaseContainerImplementation impl, String collection, String value) {
        String template = impl.getAddTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    public static String generateAddAll(BaseContainerImplementation impl, String collection, String values) {
        String template = impl.getAddAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$values$", values);
        return generateTemplate(template, map.build());
    }
    
    public static String generateClear(BaseContainerImplementation impl, String collection) {
        String template = impl.getClearTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        return generateTemplate(template, map.build());
    }
    
    public static String generateClone(BaseContainerImplementation impl, String collection, String valueType) {
        String template = impl.getCloneTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateContains(BaseContainerImplementation impl, String collection, String value) {
        String template = impl.getContainsTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    public static String generateContainsAll(BaseContainerImplementation impl, String collection, String values, String valuesType, String valueType) {
        String template = impl.getContainsAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$values$", values);
        map.put("$valuesType$", valuesType);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateIsEmpty(BaseContainerImplementation impl, String collection) {
        String template = impl.getIsEmptyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        return generateTemplate(template, map.build());
    }
    
    public static String generateRemove(BaseContainerImplementation impl, String collection, String value) {
        String template = impl.getRemoveTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    public static String generateRemoveAll(BaseContainerImplementation impl, String collection, String values, String valuesType, String valueType) {
        String template = impl.getRemoveAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$values$", values);
        map.put("$valuesType$", valuesType);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateRetainAll(BaseContainerImplementation impl, String collection, String values, String valueType) {
        String template = impl.getRetainAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$values$", values);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateSize(BaseContainerImplementation impl, String collection) {
        String template = impl.getSizeTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        return generateTemplate(template, map.build());
    }
    
    
    
    public static String generateAdd(BaseContainerImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor itemToAdd) {
        return generateAdd(impl, context.getStringRepresentation(), itemToAdd.getStringRepresentation());
    }
    
    public static String generateAdd(BaseContainerImplementation impl, CollectionVariableDescriptor context, LiteralDescriptor itemToAdd) {
        return generateAdd(impl, context.getStringRepresentation(), itemToAdd.getStringRepresentation());
    }
    
    public static String generateAddAll(BaseContainerImplementation impl, CollectionVariableDescriptor context, CollectionVariableDescriptor values) {
        return generateAddAll(impl, context.getStringRepresentation(), values.getStringRepresentation());
    }
    
    public static String generateClear(BaseContainerImplementation impl, CollectionVariableDescriptor context) {
        return generateClear(impl, context.getStringRepresentation());
    }
    
    public static String generateClone(BaseContainerImplementation impl, CollectionVariableDescriptor context) {
        return generateClone(impl, context.getStringRepresentation(), context.getTemplateTypes().get(0));
    }
    
    public static String generateContains(BaseContainerImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor itemToContain) {
        return generateContains(impl, context.getStringRepresentation(), itemToContain.getStringRepresentation());
    }
    
    public static String generateContainsAll(BaseContainerImplementation impl, CollectionVariableDescriptor context, CollectionVariableDescriptor itemsToContain) {
        return generateContainsAll(impl, context.getStringRepresentation(), itemsToContain.getStringRepresentation(), 
                    itemsToContain.getBaseType(), 
                    itemsToContain.getTemplateTypes().get(0));
    }
    
    public static String generateIsEmpty(BaseContainerImplementation impl, CollectionVariableDescriptor context) {
        return generateIsEmpty(impl, context.getStringRepresentation());
    }
    
    public static String generateRemove(BaseContainerImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor itemToRemove) {
        return generateRemove(impl, context.getStringRepresentation(), itemToRemove.getStringRepresentation());
    }
    
    public static String generateRemoveAll(BaseContainerImplementation impl, CollectionVariableDescriptor context, CollectionVariableDescriptor itemsToRemove) {
        return generateRemoveAll(impl, context.getStringRepresentation(), itemsToRemove.getStringRepresentation(), 
                    itemsToRemove.getBaseType(), 
                    itemsToRemove.getTemplateTypes().get(0));
    }
    
    public static String generateRetainAll(BaseContainerImplementation impl, CollectionVariableDescriptor context, CollectionVariableDescriptor itemsToRetain) {
        return generateRetainAll(impl, context.getStringRepresentation(), itemsToRetain.getStringRepresentation(), context.getTemplateTypes().get(0));
    }
    
    public static String generateSize(BaseContainerImplementation impl, CollectionVariableDescriptor context) {
        return generateSize(impl, context.getStringRepresentation());
    }
}
