#ifndef __XTUML__EMPTY_HH
#define __XTUML__EMPTY_HH

namespace xtuml {
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
