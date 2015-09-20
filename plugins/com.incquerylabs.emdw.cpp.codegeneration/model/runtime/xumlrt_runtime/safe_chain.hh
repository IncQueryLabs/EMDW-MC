#ifndef __XTUML__SAFE_CHAIN_HH
#define __XTUML__SAFE_CHAIN_HH

namespace xtuml {
  template<class Left, class Right>
  inline Right& safe_chain(Left* const left,  Right Left::* const right) {
    static Right empty;
    return (left)?left->*right:empty;
  }
}

#endif
