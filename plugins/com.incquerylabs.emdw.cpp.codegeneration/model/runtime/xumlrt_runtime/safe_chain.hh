#ifndef __XUMLRT__SAFE_CHAIN_HH
#define __XUMLRT__SAFE_CHAIN_HH

namespace xumlrt {
  template<class Left, class Right>
  inline Right& safe_chain(Left* const left,  Right Left::* const right) {
    static Right empty;
    return (left)?left->*right:empty;
  }
}

#endif
