#ifndef __XTUML__SELECT_MANY_HH
#define __XTUML__SELECT_MANY_HH

#include <list>
#include <set>

#include "downcasted_chain.hh"
#include "indirect_chain.hh"
#include "merged_chain.hh"
#include "upcasted_chain.hh"

namespace xtuml {
  template<class Value>
  inline std::set<Value> select_many(const std::list<Value> &ct) {
    return std::set<Value>(ct.begin(), ct.end());
  }

  template<class Value>
  inline std::set<Value> select_many(const std::set<Value> &ct) {
    return std::set<Value>(ct.begin(), ct.end());
  }

  template<class Value, class Container>
  inline std::set<Value> select_many(const downcasted_multi_selection<Value, Container> &ct) {
    return std::set<Value>(ct.begin(), ct.end());
  }

  template<class Value, class Container>
  inline std::set<Value> select_many(const upcasted_multi_selection<Value, Container> &ct) {
    return std::set<Value>(ct.begin(), ct.end());
  }

  template<class Value, class Container, class Member>
  inline std::set<Value> select_many(const indirect_multi_selection<Value, Container, Member> &ct) {
    return std::set<Value>(ct.begin(), ct.end());
  }

  template<class Value, class Container, class Member, class Remote>
  inline std::set<Value> select_many(const merged_multi_selection<Value, Container, Member, Remote> &ct) {
    return std::set<Value>(ct.begin(), ct.end());
  }

  template<class Value>
  inline std::set<Value> select_many(Value const val) {
    std::set<Value> result;
    if(val) {
      result.insert(val);
    }
    return result;
  }
}

#endif
