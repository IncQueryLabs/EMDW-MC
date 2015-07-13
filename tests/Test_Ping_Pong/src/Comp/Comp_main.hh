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
class CompMain : public ActiveComponent {
public:
    CompMain(){}
private:
    CompMain(const CompMain&);
    CompMain& operator=(const CompMain&);
};
} /* namespace Comp */
} /* namespace model */

#endif /* __MODEL__COMP_MAIN_HEADER */

