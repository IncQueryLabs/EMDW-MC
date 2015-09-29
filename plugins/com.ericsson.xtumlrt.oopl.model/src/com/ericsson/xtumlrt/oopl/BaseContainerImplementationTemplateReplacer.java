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
    
    public static String generateAdd(BaseContainerImplementation impl, String prefix, String collection, String value, String valueType) {
        String template = impl.getAddTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateAddAll(BaseContainerImplementation impl, String prefix, String collection, String values) {
        String template = impl.getAddAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$values$", values);
        return generateTemplate(template, map.build());
    }
    
    public static String generateClear(BaseContainerImplementation impl, String prefix, String collection) {
        String template = impl.getClearTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        return generateTemplate(template, map.build());
    }
    
    public static String generateClone(BaseContainerImplementation impl, String prefix, String collection, String valueType) {
        String template = impl.getCloneTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$prefix$", prefix);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateContains(BaseContainerImplementation impl, String prefix, String collection, String value) {
        String template = impl.getContainsTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    public static String generateContainsAll(BaseContainerImplementation impl, String prefix, String collection, String values, String valuesType, String valueType) {
        String template = impl.getContainsAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$values$", values);
        map.put("$valuesType$", valuesType);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateIsEmpty(BaseContainerImplementation impl, String prefix, String collection) {
        String template = impl.getIsEmptyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        return generateTemplate(template, map.build());
    }
    
    public static String generateRemove(BaseContainerImplementation impl, String prefix, String collection, String value) {
        String template = impl.getRemoveTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    public static String generateRemoveAll(BaseContainerImplementation impl, String prefix, String collection, String values, String valuesType, String valueType) {
        String template = impl.getRemoveAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$values$", values);
        map.put("$valuesType$", valuesType);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateRetainAll(BaseContainerImplementation impl, String prefix, String collection, String values, String valueType) {
        String template = impl.getRetainAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$values$", values);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateSize(BaseContainerImplementation impl, String prefix, String collection) {
        String template = impl.getSizeTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        return generateTemplate(template, map.build());
    }
    
    
    
    public static String generateAdd(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, SingleVariableDescriptor itemToAdd) {
        return generateAdd(impl, prefix, context.getStringRepresentation(), itemToAdd.getStringRepresentation(), context.getTemplateTypes().get(0));
    }
    
    public static String generateAdd(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, LiteralDescriptor itemToAdd) {
        return generateAdd(impl, prefix, context.getStringRepresentation(), itemToAdd.getStringRepresentation(), context.getTemplateTypes().get(0));
    }
    
    public static String generateAddAll(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, CollectionVariableDescriptor values) {
        return generateAddAll(impl, prefix, context.getStringRepresentation(), values.getStringRepresentation());
    }
    
    public static String generateClear(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context) {
        return generateClear(impl, prefix, context.getStringRepresentation());
    }
    
    public static String generateClone(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context) {
        return generateClone(impl, prefix, context.getStringRepresentation(), context.getTemplateTypes().get(0));
    }
    
    public static String generateContains(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, SingleVariableDescriptor itemToContain) {
        return generateContains(impl, prefix, context.getStringRepresentation(), itemToContain.getStringRepresentation());
    }
    
    public static String generateContainsAll(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, CollectionVariableDescriptor itemsToContain) {
        return generateContainsAll(impl, prefix, context.getStringRepresentation(), itemsToContain.getStringRepresentation(), 
                    itemsToContain.getBaseType(), 
                    itemsToContain.getTemplateTypes().get(0));
    }
    
    public static String generateIsEmpty(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context) {
        return generateIsEmpty(impl, prefix, context.getStringRepresentation());
    }
    
    public static String generateRemove(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, SingleVariableDescriptor itemToRemove) {
        return generateRemove(impl, prefix, context.getStringRepresentation(), itemToRemove.getStringRepresentation());
    }
    
    public static String generateRemoveAll(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, CollectionVariableDescriptor itemsToRemove) {
        return generateRemoveAll(impl, prefix, context.getStringRepresentation(), itemsToRemove.getStringRepresentation(), 
                    itemsToRemove.getBaseType(), 
                    itemsToRemove.getTemplateTypes().get(0));
    }
    
    public static String generateRetainAll(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context, CollectionVariableDescriptor itemsToRetain) {
        return generateRetainAll(impl, prefix, context.getStringRepresentation(), itemsToRetain.getStringRepresentation(), context.getTemplateTypes().get(0));
    }
    
    public static String generateSize(BaseContainerImplementation impl, String prefix, CollectionVariableDescriptor context) {
        return generateSize(impl, prefix, context.getStringRepresentation());
    }
}
