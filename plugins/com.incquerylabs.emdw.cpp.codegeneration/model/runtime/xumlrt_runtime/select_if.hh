#ifndef __XTUML__SELECT_IF_HH
#define __XTUML__SELECT_IF_HH

namespace xtuml {
  template<class Value, class Predicate>
  inline Value* select_if(Value* const val, const Predicate& pr) {
    if(val&&pr(val)) {
      return val;
    } else {
      return nullptr;
    }
  }
}

#endif
