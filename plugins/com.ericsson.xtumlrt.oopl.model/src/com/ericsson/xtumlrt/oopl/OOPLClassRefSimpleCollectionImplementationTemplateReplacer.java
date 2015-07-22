package com.ericsson.xtumlrt.oopl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

public class OOPLClassRefSimpleCollectionImplementationTemplateReplacer extends BaseContainerImplementationTemplateReplacer {
    
    /**************************************************
     * 
     * CPPClassRefSimpleCollectionImplementation templates
     * 
     **************************************************/
    
    public static String generateElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String collection, String valueType, String index, String result) {
        String template = impl.getElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateInsertElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String collection, String value, String valueType, String index) {
        String template = impl.getInsertElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    public static String generateReplaceElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String collection, String value, String valueType, String index) {
        String template = impl.getReplaceElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    // TODO
    
    public static String generateElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, CollectionDescriptor context, int index, VariableDescriptor result) {
        return null;
    }
    
    public static String generateInsertElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, CollectionDescriptor context, ValueDescriptor value, int index) {
        return null;
    }
    
    public static String generateReplaceElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, CollectionDescriptor context, ValueDescriptor value, int index) {
        return null;
    }
}
