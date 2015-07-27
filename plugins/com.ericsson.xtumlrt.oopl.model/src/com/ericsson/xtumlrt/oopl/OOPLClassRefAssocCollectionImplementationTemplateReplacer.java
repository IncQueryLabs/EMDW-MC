package com.ericsson.xtumlrt.oopl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

public class OOPLClassRefAssocCollectionImplementationTemplateReplacer extends BaseContainerImplementationTemplateReplacer {
    
    /**************************************************
     * 
     * CPPClassRefAssocCollectionImplementation templates
     * 
     **************************************************/
    
    public static String generateAny(OOPLClassRefAssocCollectionImplementation impl, String collection, String valueType, String result) {
        String template = impl.getAnyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$valueType$", valueType);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateCountOf(OOPLClassRefAssocCollectionImplementation impl, String collection, String value, String result) {
        String template = impl.getCountOfTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    
    
    public static String generateAny(OOPLClassRefAssocCollectionImplementation impl, CollectionDescriptor context, VariableDescriptor result) {
        return generateAny(impl, context.getName(), result.getValueType(), result.getStringRepresentation());
    }
    
    public static String generateCountOf(OOPLClassRefAssocCollectionImplementation impl, CollectionDescriptor context, ValueDescriptor itemToCount, VariableDescriptor result) {
        return generateCountOf(impl, context.getName(), itemToCount.getStringRepresentation(), result.getStringRepresentation());
    }
}
