package com.incquerylabs.emdw.umlintegration.rules

class CommonPriorities {

	public static val VERTEX_MAPPING_PRIORITY = 1

	public static val TYPE_MAPPING_PRIORITY = Math.max(XTClassMapping.PRIORITY, XTComponentMapping.PRIORITY)

}