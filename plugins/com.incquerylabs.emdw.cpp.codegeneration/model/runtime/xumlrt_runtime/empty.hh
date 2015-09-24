#ifndef __XUMLRT__EMPTY_HH
#define __XUMLRT__EMPTY_HH

namespace xumlrt {
  template <class T>
  bool empty(T *const t) {
    return t==nullptr;
  }

  template <class Cont>
  bool empty(const Cont &cont) {
    return cont.begin()==cont.end();
  }
}

#endif
