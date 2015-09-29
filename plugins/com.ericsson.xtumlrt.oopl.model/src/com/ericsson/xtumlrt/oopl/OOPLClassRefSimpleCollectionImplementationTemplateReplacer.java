package com.ericsson.xtumlrt.oopl;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor;
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor;

public class OOPLClassRefSimpleCollectionImplementationTemplateReplacer extends BaseContainerImplementationTemplateReplacer {
    
    /**************************************************
     * 
     * CPPClassRefSimpleCollectionImplementation templates
     * 
     **************************************************/
    
    public static String generateElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String prefix, String collection, String valueType, String index) {
        String template = impl.getElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    public static String generateInsertElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String prefix, String collection, String value, String valueType, String index) {
        String template = impl.getInsertElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    public static String generateReplaceElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String prefix, String collection, String value, String valueType, String index) {
        String template = impl.getReplaceElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$prefix$", prefix);
        map.put("$value$", value);
        map.put("$valueType$", valueType);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    // TODO
    
    public static String generateElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String prefix, CollectionVariableDescriptor context, Integer index) {
        return generateElementAtIndex(impl, context.getStringRepresentation(), prefix, context.getTemplateTypes().get(0), index.toString());
    }
    
    public static String generateInsertElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String prefix, CollectionVariableDescriptor context, SingleVariableDescriptor itemToInsert, Integer index) {
        return generateInsertElementAtIndex(impl, context.getStringRepresentation(), prefix, itemToInsert.getStringRepresentation(), context.getTemplateTypes().get(0), index.toString());
    }
    
    public static String generateReplaceElementAtIndex(OOPLClassRefSimpleCollectionImplementation impl, String prefix, CollectionVariableDescriptor context, SingleVariableDescriptor itemToReplace, Integer index) {
        return generateReplaceElementAtIndex(impl, context.getStringRepresentation(), prefix, itemToReplace.getStringRepresentation(), context.getTemplateTypes().get(0), index.toString());
    }
}
