package com.ericsson.xtumlrt.oopl;

import java.util.Map;
import java.util.Map.Entry;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

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
}
