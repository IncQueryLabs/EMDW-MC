/******************************************************************************
 *
 * C O M P O N E N T   M A I N   ( H E A D E R )
 *
 * NAME: Comp
 *
 *
 *
 ******************************************************************************/

#ifndef __MODEL__COMP_MAIN_HEADER
#define __MODEL__COMP_MAIN_HEADER

#include "Comp_decl.hh"
#include "../Runtime/ActiveComponent.hh"

namespace model{
namespace Comp{
class Comp : public ActiveComponent {
public:
    Comp(){}
private:
    Comp(const Comp&);
    Comp& operator=(const Comp&);
};
} /* namespace Comp */
} /* namespace model */

#endif /* __MODEL__COMP_MAIN_HEADER */

