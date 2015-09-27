#ifndef __XUMLRT__SELECT_ANY_HH
#define __XUMLRT__SELECT_ANY_HH

#include <list>
#include <set>

#include "downcasted_chain.hh"
#include "indirect_chain.hh"
#include "merged_chain.hh"
#include "upcasted_chain.hh"

namespace xumlrt {
  template<class Value>
  inline Value select_any(const std::list<Value> &ct) {
    return (ct.begin()!=ct.end())?*ct.begin():nullptr;
  }

  template<class Value>
  inline Value select_any(const std::set<Value> &ct) {
    return (ct.begin()!=ct.end())?*ct.begin():nullptr;
  }

  template<class Value, class Container>
  inline Value select_any(const downcasted_multi_selection<Value, Container> &ct) {
    return (ct.begin()!=ct.end())?*ct.begin():nullptr;
  }

  template<class Value, class Container>
  inline Value select_any(const upcasted_multi_selection<Value, Container> &ct) {
    return (ct.begin()!=ct.end())?*ct.begin():nullptr;
  }

  template<class Value, class Container, class Member>
  inline Value select_any(const indirect_multi_selection<Value, Container, Member> &ct) {
    return (ct.begin()!=ct.end())?*ct.begin():nullptr;
  }

  template<class Value, class Container, class Member, class Remote>
  inline Value select_any(const merged_multi_selection<Value, Container, Member, Remote> &ct) {
    return (ct.begin()!=ct.end())?*ct.begin():nullptr;
  }

  template<class Value>
  inline Value select_any(Value const val) {
    return val?val:nullptr;
  }
}

#endif
