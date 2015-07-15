package com.ericsson.xtumlrt.oopl.cppmodel;

import java.util.HashMap;
import java.util.Map;

public class ContainerImplementationTemplateReplacer {
    private static String generateTemplate(String template, Map<String, String> map) {
        for(String key : map.keySet()) {
            template = template.replace(key, map.get(key));
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
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$result$", result);
        return generateTemplate(template, map);
    }
    
    public static String generateAddAll(BaseContainerImplementation impl, String collection, String values) {
        String template = impl.getAddAllTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$values$", values);
        return generateTemplate(template, map);
    }
    
    public static String generateClear(BaseContainerImplementation impl, String collection) {
        String template = impl.getClearTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        return generateTemplate(template, map);
    }
    
    public static String generateClone(BaseContainerImplementation impl, String collection) {
        String template = impl.getCloneTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        return generateTemplate(template, map);
    }
    
    public static String generateContains(BaseContainerImplementation impl, String collection, String value) {
        String template = impl.getContainsTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map);
    }
    
    public static String generateContainsAll(BaseContainerImplementation impl, String collection, String values) {
        String template = impl.getContainsAllTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$values$", values);
        return generateTemplate(template, map);
    }
    
    public static String generateIsEmpty(BaseContainerImplementation impl, String collection) {
        String template = impl.getIsEmptyTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        return generateTemplate(template, map);
    }
    
    public static String generateRemove(BaseContainerImplementation impl, String collection, String value) {
        String template = impl.getRemoveTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map);
    }
    
    public static String generateRemoveAll(BaseContainerImplementation impl, String collection, String values) {
        String template = impl.getRemoveAllTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$values$", values);
        return generateTemplate(template, map);
    }
    
    public static String generateRetainAll(BaseContainerImplementation impl, String collection, String values) {
        String template = impl.getRetainAllTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$values$", values);
        return generateTemplate(template, map);
    }
    
    public static String generateSize(BaseContainerImplementation impl, String collection) {
        String template = impl.getSizeTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        return generateTemplate(template, map);
    }
    
    
    /**************************************************
     * 
     * CPPClassRefSimpleCollectionImplementation templates
     * 
     **************************************************/
    
    public static String generateElementAtIndex(CPPClassRefSimpleCollectionImplementation impl, String collection, String index) {
        String template = impl.getElementAtIndexTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$index$", index);
        return generateTemplate(template, map);
    }
    
    public static String generateInsertElementAtIndex(CPPClassRefSimpleCollectionImplementation impl, String collection, String value, String index) {
        String template = impl.getInsertElementAtIndexTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$index$", index);
        return generateTemplate(template, map);
    }
    
    public static String generateReplaceElementAtIndex(CPPClassRefSimpleCollectionImplementation impl, String collection, String value, String index) {
        String template = impl.getReplaceElementAtIndexTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$index$", index);
        return generateTemplate(template, map);
    }

    
    /**************************************************
     * 
     * CPPClassRefAssocCollectionImplementation templates
     * 
     **************************************************/
    
    public static String generateCountOf(CPPClassRefAssocCollectionImplementation impl, String collection, String value) {
        String template = impl.getCountOfTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map);
    }
    
    public static String generateAny(CPPClassRefAssocCollectionImplementation impl, String collection) {
        String template = impl.getAnyTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        return generateTemplate(template, map);
    }

    
    /**************************************************
     * 
     * CPPSequenceImplementation templates
     * 
     **************************************************/
    
    public static String generateElementAtIndex(CPPSequenceImplementation impl, String collection, String index) {
        String template = impl.getElementAtIndexTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$index$", index);
        return generateTemplate(template, map);
    }
    
    public static String generateInsertElementAtIndex(CPPSequenceImplementation impl, String collection, String value, String index) {
        String template = impl.getInsertElementAtIndexTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$index$", index);
        return generateTemplate(template, map);
    }
    
    public static String generateReplaceElementAtIndex(CPPSequenceImplementation impl, String collection, String value, String index) {
        String template = impl.getReplaceElementAtIndexTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$index$", index);
        return generateTemplate(template, map);
    }

    public static String generateCountOf(CPPSequenceImplementation impl, String collection, String value) {
        String template = impl.getCountOfTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map);
    }
    
    public static String generateAny(CPPSequenceImplementation impl, String collection) {
        String template = impl.getAnyTemplate();
        Map<String,String> map = new HashMap<String, String>();
        map.put("$collection$", collection);
        return generateTemplate(template, map);
    }
}
