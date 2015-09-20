#ifndef __XTUML__SELECT_MANY_WHERE_HH
#define __XTUML__SELECT_MANY_WHERE_HH

#include <algorithm>
#include <functional>
#include <list>
#include <set>
#include <iterator>

#include "downcasted_chain.hh"
#include "indirect_chain.hh"
#include "merged_chain.hh"
#include "upcasted_chain.hh"

namespace xtuml {
  template<class Value, class Predicate, class Container, class Member>
  inline std::set<Value> select_many_where(const indirect_multi_selection<Value, Container, Member> &ct,
      const Predicate& pr) {
    std::set<Value> result;
    typename std::set<Value>::iterator res_it = result.begin();
    std::copy_if(ct.begin(), ct.end(), std::inserter(result, res_it), pr);
    return result;
  }

  template<class Value, class Predicate, class Container>
  inline std::set<Value> select_many_where(const downcasted_multi_selection<Value, Container> &ct,
      const Predicate& pr) {
    std::set<Value> result;
    typename std::set<Value>::iterator res_it = result.begin();
    std::copy_if(ct.begin(), ct.end(), std::inserter(result, res_it), pr);
    return result;
  }

  template<class Value, class Predicate, class Container>
  inline std::set<Value> select_many_where(const upcasted_multi_selection<Value, Container> &ct,
      const Predicate& pr) {
    std::set<Value> result;
    typename std::set<Value>::iterator res_it = result.begin();
    std::copy_if(ct.begin(), ct.end(), std::inserter(result, res_it), pr);
    return result;
  }

  template<class Value, class Predicate, class Container, class Member, class Remote>
  inline std::set<Value> select_many_where(const merged_multi_selection<Value, Container, Member, Remote> &ct,
      const Predicate& pr) {
    std::set<Value> result;
    typename std::set<Value>::iterator res_it = result.begin();
    std::copy_if(ct.begin(), ct.end(), std::inserter(result, res_it), pr);
    return result;
  }

  template<class Value, class Predicate>
  inline std::set<Value> select_many_where(const std::list<Value> &ct, const Predicate& pr) {
    std::set<Value> result;
    typename std::set<Value>::iterator res_it = result.begin();
    std::copy_if(ct.begin(), ct.end(), std::inserter(result, res_it), pr);
    return result;
  }

  template<class Value, class Predicate>
  inline std::set<Value> select_many_where(Value const val, const Predicate& pr) {
    std::set<Value> result;
    if(val&&pr(val)) {
      result.insert(val);
    }
    return result;
  }
}

#endif
