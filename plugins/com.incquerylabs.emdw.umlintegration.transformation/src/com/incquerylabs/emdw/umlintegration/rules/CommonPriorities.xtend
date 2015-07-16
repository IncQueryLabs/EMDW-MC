package com.incquerylabs.emdw.umlintegration.rules

class CommonPriorities {

	public static val int VERTEX_MAPPING_PRIORITY = 1
	
	public static val int CLASS_MAPPING_PRIORITY = 1
	
	public static val int EVENT_MAPPING_PRIORITY = CLASS_MAPPING_PRIORITY + 1
	
	public static val int TYPE_MAPPING_PRIORITY = Math.max(XTClassMapping.PRIORITY, XTComponentMapping.PRIORITY)
	
	public static val int OPERATION_MAPPING_PRIORITY = TYPE_MAPPING_PRIORITY + 1
	
	public static val int ACTION_MAPPING_PRIORITY = 2

}