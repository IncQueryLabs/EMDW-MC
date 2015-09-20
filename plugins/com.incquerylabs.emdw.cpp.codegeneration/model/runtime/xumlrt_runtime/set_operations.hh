#ifndef __XTUML__SET_OPERATIONS_HH
#define __XTUML__SET_OPERATIONS_HH

#include <algorithm>
#include <iterator>
#include <set>

namespace xtuml {
  template<class Value> std::set<Value*> set_union(Value* const& lhs, Value* const& rhs) {
    std::set<Value*> result;
    result.insert(lhs);
    result.insert(rhs);
    return result;
  }

  template<class Value> std::set<Value*> set_union(const std::set<Value*>& lhs, Value* const& rhs) {
    std::set<Value*> result = lhs;
    result.insert(rhs);
    return result;
  }

  template<class Value> std::set<Value*> set_union(Value* const& lhs, const std::set<Value*>& rhs) {
    std::set<Value*> result = rhs;
    result.insert(lhs);
    return result;
  }

  template<class Value> std::set<Value*> set_union(const std::set<Value*>& lhs, const std::set<Value*>& rhs) {
    std::set<Value*> result;
    typename std::set<Value*>::iterator res_it = result.begin();
    std::set_union(lhs.begin(), lhs.end(), rhs.begin(), rhs.end(), std::inserter(result, res_it));
    return result;
  }

  template<class Value> std::set<Value*> set_intersection(Value* const& lhs, Value* const& rhs) {
    std::set<Value*> result;
    if(lhs==rhs) {
      result.insert(lhs);
    }
    return result;
  }

  template<class Value> std::set<Value*> set_intersection(const std::set<Value*>& lhs, Value* const& rhs) {
    std::set<Value*> result;
    if(lhs.count(rhs)) {
      result.insert(rhs);
    }
    return result;
  }

  template<class Value> std::set<Value*> set_intersection(Value* const& lhs, const std::set<Value*>& rhs) {
    std::set<Value*> result;
    if(rhs.count(lhs)) {
      result.insert(lhs);
    }
    return result;
  }

  template<class Value> std::set<Value*> set_intersection(const std::set<Value*>& lhs, const std::set<Value*>& rhs) {
    std::set<Value*> result;
    typename std::set<Value*>::iterator res_it = result.begin();
    std::set_intersection(lhs.begin(), lhs.end(), rhs.begin(), rhs.end(), std::inserter(result, res_it));
    return result;
  }

  template<class Value> std::set<Value*> set_difference(Value* const& rhs, Value* const& lhs) {
    std::set<Value*> result;
    if(lhs!=rhs) {
      result.insert(lhs);
    }
    return result;
  }

  template<class Value> std::set<Value*> set_difference(const std::set<Value*>& lhs, Value* const& rhs) {
    std::set<Value*> result = lhs;
    result.erase(rhs);
    return result;
  }

  template<class Value> std::set<Value*> set_difference(Value* const& lhs, const std::set<Value*>& rhs) {
    std::set<Value*> result;
    if(!rhs.count(lhs)) {
      result.insert(lhs);
    }
    return result;
  }

  template<class Value> std::set<Value*> set_difference(const std::set<Value*>& lhs, const std::set<Value*>& rhs) {
    std::set<Value*> result;
    typename std::set<Value*>::iterator res_it = result.begin();
    std::set_difference(lhs.begin(), lhs.end(), rhs.begin(), rhs.end(), std::inserter(result, res_it));
    return result;
  }
}

#endif
