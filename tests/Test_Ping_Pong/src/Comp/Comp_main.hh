/*
 * Comp_main.h
 *
 *  Created on: Jun 24, 2015
 *      Author: Robert Doczi
 */


#include "../Runtime/ActiveComponent.hh"
#include "Comp_decl.hh"

namespace model {
namespace Comp {

class CompMain : public ActiveComponent {
public:
    CompMain(){}
private:
    CompMain(const CompMain&);
    CompMain& operator=(const CompMain&);
};

}  // namespace Comp
}  // namespace model
