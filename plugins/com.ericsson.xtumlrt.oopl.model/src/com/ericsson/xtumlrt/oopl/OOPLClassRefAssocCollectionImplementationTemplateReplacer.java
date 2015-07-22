package com.ericsson.xtumlrt.oopl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

public class OOPLClassRefAssocCollectionImplementationTemplateReplacer extends BaseContainerImplementationTemplateReplacer {
    
    /**************************************************
     * 
     * CPPClassRefAssocCollectionImplementation templates
     * 
     **************************************************/
    
    public static String generateCountOf(OOPLClassRefAssocCollectionImplementation impl, String collection, String value) {
        String template = impl.getCountOfTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    public static String generateAny(OOPLClassRefAssocCollectionImplementation impl, String collection) {
        String template = impl.getAnyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        return generateTemplate(template, map.build());
    }
    
    // TODO
    
    public static String generateCountOf(OOPLClassRefAssocCollectionImplementation impl, CollectionDescriptor context, ValueDescriptor itemToCount, VariableDescriptor result) {
        return null;
    }
    
    public static String generateAny(OOPLClassRefAssocCollectionImplementation impl, CollectionDescriptor collection, VariableDescriptor result) {
        return null;
    }
}
