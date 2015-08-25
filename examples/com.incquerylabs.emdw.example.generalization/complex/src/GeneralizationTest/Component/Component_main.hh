/******************************************************************************
 *
 * C O M P O N E N T   M A I N   ( H E A D E R )
 *
 * NAME: Component
 *
 *
 *
 ******************************************************************************/

#ifndef __GENERALIZATIONTEST__COMPONENT_MAIN_HEADER
#define __GENERALIZATIONTEST__COMPONENT_MAIN_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "Runtime/ActiveComponent.hh"

namespace GeneralizationTest{
namespace Component{
class Component : public ActiveComponent {
public:
    Component(){}
private:
    Component(const Component&);
    Component& operator=(const Component&);
};
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT_MAIN_HEADER */

