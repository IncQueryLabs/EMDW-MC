package com.ericsson.xtumlrt.oopl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor;
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor;

public class OOPLSequenceImplementationTemplateReplacer extends BaseContainerImplementationTemplateReplacer {
    
    /**************************************************
     * 
     * CPPSequenceImplementation templates
     * 
     **************************************************/
    
    public static String generateAny(OOPLSequenceImplementation impl, String collection, String valueType, String result) {
        String template = impl.getAnyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$valueType$", valueType);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }

    public static String generateCountOf(OOPLSequenceImplementation impl, String collection, String value, String result) {
        String template = impl.getCountOfTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateElementAtIndex(OOPLSequenceImplementation impl, String collection, String valueType, String index, String result) {
        String template = impl.getElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        map.put("$result$", result);
        return generateTemplate(template, map.build());
    }
    
    public static String generateInsertElementAtIndex(OOPLSequenceImplementation impl, String collection, String value, String valueType, String index) {
        String template = impl.getInsertElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    public static String generateReplaceElementAtIndex(OOPLSequenceImplementation impl, String collection, String value, String valueType, String index) {
        String template = impl.getReplaceElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    
    
    public static String generateAny(OOPLSequenceImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor result) {
        return generateAny(impl, context.getStringRepresentation(), result.getTemplateTypes().get(0), result.getStringRepresentation());
    }

    public static String generateCountOf(OOPLSequenceImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor itemToCount, SingleVariableDescriptor result) {
        return generateCountOf(impl, context.getStringRepresentation(), itemToCount.getStringRepresentation(), result.getStringRepresentation());
    }
    
    public static String generateElementAtIndex(OOPLSequenceImplementation impl, CollectionVariableDescriptor context, Integer index, SingleVariableDescriptor result) {
        return generateElementAtIndex(impl, context.getStringRepresentation(), context.getTemplateTypes().get(0), index.toString(), result.getStringRepresentation());
    }
    
    public static String generateInsertElementAtIndex(OOPLSequenceImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor itemToInsert, Integer index) {
        return generateInsertElementAtIndex(impl, context.getStringRepresentation(), itemToInsert.getStringRepresentation(), context.getTemplateTypes().get(0), index.toString());
    }
    
    public static String generateReplaceElementAtIndex(OOPLSequenceImplementation impl, CollectionVariableDescriptor context, SingleVariableDescriptor itemToReplace, Integer index) {
        return generateReplaceElementAtIndex(impl, context.getStringRepresentation(), itemToReplace.getStringRepresentation(), context.getTemplateTypes().get(0), index.toString());
    }
}
