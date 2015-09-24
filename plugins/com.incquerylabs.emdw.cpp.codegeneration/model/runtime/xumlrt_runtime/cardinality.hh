#ifndef __XUMLRT__CARDINALITY_HH
#define __XUMLRT__CARDINALITY_HH

#include <iterator>

namespace xumlrt {
  template <class T>
  unsigned long cardinality(T *const t) {
    return (t!=nullptr)?1:0;
  }

  template <class Cont>
  unsigned long cardinality(const Cont &cont) {
    return std::distance(cont.begin(), cont.end());
  }
}

#endif
