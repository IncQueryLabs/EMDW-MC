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
    
    public static String generateAny(OOPLClassRefAssocCollectionImplementation impl, String prefix, String collection, String valueType) {
        String template = impl.getAnyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$valueType$", valueType);
        return generateTemplate(template, map.build());
    }
    
    public static String generateCountOf(OOPLClassRefAssocCollectionImplementation impl, String prefix, String collection, String value) {
        String template = impl.getCountOfTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    
    
    public static String generateAny(OOPLClassRefAssocCollectionImplementation impl, String prefix, CollectionVariableDescriptor context, SingleVariableDescriptor result) {
        return generateAny(impl, prefix, context.getStringRepresentation(), context.getTemplateTypes().get(0));
    }
    
    public static String generateCountOf(OOPLClassRefAssocCollectionImplementation impl, String prefix, CollectionVariableDescriptor context, SingleVariableDescriptor itemToCount) {
        return generateCountOf(impl, prefix, context.getStringRepresentation(), itemToCount.getStringRepresentation());
    }
}
