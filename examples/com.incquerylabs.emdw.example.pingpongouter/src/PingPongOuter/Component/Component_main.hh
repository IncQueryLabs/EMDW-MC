/******************************************************************************
 *
 * C O M P O N E N T   M A I N   ( H E A D E R )
 *
 * NAME: Component
 *
 *
 *
 ******************************************************************************/

#ifndef __PINGPONGOUTER__COMPONENT_MAIN_HEADER
#define __PINGPONGOUTER__COMPONENT_MAIN_HEADER

#include "PingPongOuter/Component/Component_decl.hh"
#include "Runtime/ActiveComponent.hh"

namespace PingPongOuter{
namespace Component{
class Component : public ActiveComponent {
public:
    Component(){}
private:
    Component(const Component&);
    Component& operator=(const Component&);
};
} /* namespace Component */
} /* namespace PingPongOuter */

#endif /* __PINGPONGOUTER__COMPONENT_MAIN_HEADER */

