package com.ericsson.xtumlrt.oopl;

import java.util.Map;
import java.util.Map.Entry;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.incquerylabs.emdw.valuedescriptor.CollectionValueDescriptor;
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor;

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
    
    public static String generateAdd(BaseContainerImplementation impl, String collection, String value, String result) {
        String template = impl.getAddTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$result$", result);
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
    
    public static String generateClone(BaseContainerImplementation impl, String collection, String valueType, String result) {
        String template = impl.getCloneTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$valueType$", valueType);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateContains(BaseContainerImplementation impl, String collection, String value, String result) {
        String template = impl.getContainsTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateContainsAll(BaseContainerImplementation impl, String collection, String values, String valuesType, String valueType, String result) {
        String template = impl.getContainsAllTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$values$", values);
        map.put("$valuesType$", valuesType);
        map.put("$valueType$", valueType);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateIsEmpty(BaseContainerImplementation impl, String collection, String result) {
        String template = impl.getIsEmptyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$result$", result);
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
    
    public static String generateSize(BaseContainerImplementation impl, String collection, String result) {
        String template = impl.getSizeTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    
    
    public static String generateAdd(BaseContainerImplementation impl, CollectionValueDescriptor context, SingleValueDescriptor itemToAdd, SingleValueDescriptor result) {
        return generateAdd(impl, context.getName(), itemToAdd.getStringRepresentation(), result.getStringRepresentation());
    }
    
    public static String generateAddAll(BaseContainerImplementation impl, CollectionValueDescriptor context, CollectionValueDescriptor values) {
        return generateAddAll(impl, context.getName(), values.getName());
    }
    
    public static String generateClear(BaseContainerImplementation impl, CollectionValueDescriptor context) {
        return generateClear(impl, context.getName());
    }
    
    public static String generateClone(BaseContainerImplementation impl, CollectionValueDescriptor context, CollectionValueDescriptor result) {
        return generateClone(impl, context.getName(), result.getValueType(), result.getName());
    }
    
    public static String generateContains(BaseContainerImplementation impl, CollectionValueDescriptor context, SingleValueDescriptor itemToContain, SingleValueDescriptor result) {
        return generateContains(impl, context.getName(), itemToContain.getStringRepresentation(), result.getStringRepresentation());
    }
    
    public static String generateContainsAll(BaseContainerImplementation impl, CollectionValueDescriptor context, CollectionValueDescriptor itemsToContain, SingleValueDescriptor result) {
        return generateContainsAll(impl, context.getName(), itemsToContain.getName(), 
                    itemsToContain.getCollectionType(), 
                    itemsToContain.getValueType(), result.getStringRepresentation());
    }
    
    public static String generateIsEmpty(BaseContainerImplementation impl, CollectionValueDescriptor context, SingleValueDescriptor result) {
        return generateIsEmpty(impl, context.getName(), result.getStringRepresentation());
    }
    
    public static String generateRemove(BaseContainerImplementation impl, CollectionValueDescriptor context, SingleValueDescriptor itemToRemove) {
        return generateRemove(impl, context.getName(), itemToRemove.getStringRepresentation());
    }
    
    public static String generateRemoveAll(BaseContainerImplementation impl, CollectionValueDescriptor context, CollectionValueDescriptor itemsToRemove) {
        return generateRemoveAll(impl, context.getName(), itemsToRemove.getName(), 
                    itemsToRemove.getCollectionType(), 
                    itemsToRemove.getValueType());
    }
    
    public static String generateRetainAll(BaseContainerImplementation impl, CollectionValueDescriptor context, CollectionValueDescriptor itemsToRetain) {
        return generateRetainAll(impl, context.getName(), itemsToRetain.getName(), context.getValueType());
    }
    
    public static String generateSize(BaseContainerImplementation impl, CollectionValueDescriptor context, SingleValueDescriptor result) {
        return generateSize(impl, context.getName(), result.getStringRepresentation());
    }
}
