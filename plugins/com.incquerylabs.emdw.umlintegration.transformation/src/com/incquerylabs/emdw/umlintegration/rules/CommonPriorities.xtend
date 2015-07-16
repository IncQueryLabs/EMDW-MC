package com.incquerylabs.emdw.umlintegration.rules

class CommonPriorities {

	public static val VERTEX_MAPPING_PRIORITY = 1
	
	public static val CLASS_MAPPING_PRIORITY = 1
	
	public static val EVENT_MAPPING_PRIORITY = CLASS_MAPPING_PRIORITY + 1
	
	public static val TYPE_MAPPING_PRIORITY = Math.max(XTClassMapping.PRIORITY, XTComponentMapping.PRIORITY)
	
	public static val OPERATION_MAPPING_PRIORITY = TYPE_MAPPING_PRIORITY + 1
	
	public static val ACTION_MAPPING_PRIORITY = 2

}