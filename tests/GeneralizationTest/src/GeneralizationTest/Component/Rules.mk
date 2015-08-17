##############################################################################
# [M O D E L / C O M P O N E N T / P A C K A G E]   M A K E   R U L E S
#
# NAME: Component
#
# Generated by EMDW-MC
#
##############################################################################

sp				:= $(sp).x
dirstack_$(sp)	:= $(d)
d				:= $(dir)



SOURCES_$(d)	:= $(wildcard $(d)/*.cc)
OBJECTS_$(d)	:= $(SOURCES_$(d):%.cc=%.o)

SOURCES	:= $(SOURCES) $(SOURCES_$(d))
OBJECTS	:= $(OBJECTS) $(OBJECTS_$(d))

d	:= $(dirstack_$(sp))
sp	:= $(basename $(sp))
