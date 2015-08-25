/******************************************************************************
 *
 * C O M P O N E N T   M A I N   ( H E A D E R )
 *
 * NAME: Component
 *
 *
 *
 ******************************************************************************/

#ifndef __PINGPONGOUTER__GLOBALCOMPONENT_MAIN_HEADER
#define __PINGPONGOUTER__GLOBALCOMPONENT_MAIN_HEADER

#include "Runtime/ActiveComponent.hh"

namespace PingPongOuter{
class GlobalComponent : public ActiveComponent {
public:
	GlobalComponent(){}
private:
	GlobalComponent(const GlobalComponent&);
	GlobalComponent& operator=(const GlobalComponent&);
};
} /* namespace PingPongSimple */

#endif /* __PINGPONGOUTER__COMPONENT_MAIN_HEADER */

