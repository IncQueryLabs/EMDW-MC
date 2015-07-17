package com.ericsson.xtumlrt.oopl.cppmodel;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

public class CPPClassRefSimpleCollectionImplementationTemplateReplacer extends BaseContainerImplementationTemplateReplacer {
    
    /**************************************************
     * 
     * CPPClassRefSimpleCollectionImplementation templates
     * 
     **************************************************/
    
    public static String generateElementAtIndex(CPPClassRefSimpleCollectionImplementation impl, String collection, String valueType, String index, String result) {
        String template = impl.getElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateInsertElementAtIndex(CPPClassRefSimpleCollectionImplementation impl, String collection, String value, String valueType, String index) {
        String template = impl.getInsertElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    public static String generateReplaceElementAtIndex(CPPClassRefSimpleCollectionImplementation impl, String collection, String value, String valueType, String index) {
        String template = impl.getReplaceElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
}
