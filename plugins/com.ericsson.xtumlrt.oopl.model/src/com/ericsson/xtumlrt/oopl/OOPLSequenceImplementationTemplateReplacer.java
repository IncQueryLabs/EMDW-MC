package com.ericsson.xtumlrt.oopl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

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
    
    
    
    public static String generateAny(OOPLSequenceImplementation impl, CollectionDescriptor context, VariableDescriptor result) {
        return generateAny(impl, context.getName(), result.getValueType().toString(), result.getStringRepresentation());
    }

    public static String generateCountOf(OOPLSequenceImplementation impl, CollectionDescriptor context, ValueDescriptor itemToCount, VariableDescriptor result) {
        return generateCountOf(impl, context.getName(), itemToCount.getStringRepresentation(), result.getStringRepresentation());
    }
    
    public static String generateElementAtIndex(OOPLSequenceImplementation impl, CollectionDescriptor context, Integer index, VariableDescriptor result) {
        return generateElementAtIndex(impl, context.getName(), context.getValueType().toString(), index.toString(), result.getStringRepresentation());
    }
    
    public static String generateInsertElementAtIndex(OOPLSequenceImplementation impl, CollectionDescriptor context, ValueDescriptor itemToInsert, Integer index) {
        return generateInsertElementAtIndex(impl, context.getName(), itemToInsert.getStringRepresentation(), context.getValueType().toString(), index.toString());
    }
    
    public static String generateReplaceElementAtIndex(OOPLSequenceImplementation impl, CollectionDescriptor context, ValueDescriptor itemToReplace, Integer index) {
        return generateReplaceElementAtIndex(impl, context.getName(), itemToReplace.getStringRepresentation(), context.getValueType().toString(), index.toString());
    }
}
