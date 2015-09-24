#ifndef __XUMLRT__SELECT_ANY_WHERE_HH
#define __XUMLRT__SELECT_ANY_WHERE_HH

#include <algorithm>
#include <list>

#include "downcasted_chain.hh"
#include "indirect_chain.hh"
#include "merged_chain.hh"
#include "upcasted_chain.hh"

namespace xumlrt {
  template<class Value, class Predicate, class Container>
  inline Value select_any_where(const downcasted_multi_selection<Value, Container> &ct, const Predicate &pr) {
    typename downcasted_multi_selection<Value, Container>::const_iterator match = std::find_if(ct.begin(), ct.end(), pr);
    return (match!=ct.end())?(*match):nullptr;
  }

  template<class Value, class Predicate, class Container>
  inline Value select_any_where(const upcasted_multi_selection<Value, Container> &ct, const Predicate &pr) {
    typename upcasted_multi_selection<Value, Container>::const_iterator match = std::find_if(ct.begin(), ct.end(), pr);
    return (match!=ct.end())?(*match):nullptr;
  }

  template<class Value, class Predicate, class Container, class Member>
  inline Value select_any_where(const indirect_multi_selection<Value, Container, Member> &ct, const Predicate &pr) {
    typename indirect_multi_selection<Value, Container, Member>::const_iterator match = std::find_if(ct.begin(), ct.end(), pr);
    return (match!=ct.end())?(*match):nullptr;
  }

  template<class Value, class Predicate, class Container, class Member, class Remote>
  inline Value select_any_where(const merged_multi_selection<Value, Container, Member, Remote> &ct, const Predicate &pr) {
    typename merged_multi_selection<Value, Container, Member, Remote>::const_iterator match = std::find_if(ct.begin(), ct.end(), pr);
    return (match!=ct.end())?(*match):nullptr;
  }

  template<class Value, class Predicate>
  inline Value select_any_where(const std::list<Value> &ct, const Predicate &pr) {
    typename std::list<Value>::const_iterator match = std::find_if(ct.begin(), ct.end(), pr);
    return (match!=ct.end())?(*match):nullptr;
  }

  template<class Value, class Predicate>
  inline Value select_any_where(const std::set<Value> &ct, const Predicate &pr) {
    typename std::list<Value>::const_iterator match = std::find_if(ct.begin(), ct.end(), pr);
    return (match!=ct.end())?(*match):nullptr;
  }

  template<class Value, class Predicate>
  inline Value select_any_where(Value const val, const Predicate& pr) {
    return (val&&pr(val))?val:nullptr;
  }
}

#endif
