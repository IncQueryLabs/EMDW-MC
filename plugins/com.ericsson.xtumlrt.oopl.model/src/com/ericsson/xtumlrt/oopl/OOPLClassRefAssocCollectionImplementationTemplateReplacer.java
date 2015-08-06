package com.ericsson.xtumlrt.oopl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor;
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor;

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
    
    
    
    public static String generateAny(OOPLClassRefAssocCollectionImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor result) {
        return generateAny(impl, context.getStringRepresentation(), result.getTemplateTypes().get(0), result.getStringRepresentation());
    }
    
    public static String generateCountOf(OOPLClassRefAssocCollectionImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor itemToCount, SingleVariableDescriptor result) {
        return generateCountOf(impl, context.getStringRepresentation(), itemToCount.getStringRepresentation(), result.getStringRepresentation());
    }
}
