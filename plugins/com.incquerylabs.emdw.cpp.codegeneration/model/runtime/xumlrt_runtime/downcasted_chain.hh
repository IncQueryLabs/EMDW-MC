#ifndef __XTUML__DOWNCASTED_CHAIN_HH
#define __XTUML__DOWNCASTED_CHAIN_HH

#include <iterator>
#include <utility>

#include "type_number.hh"

namespace xtuml {
  template<class Value, class Iter>
  class downcast_iterator: public std::iterator<std::forward_iterator_tag, Value> {
  public:
    typedef Value value_type;
    typedef const Value& reference;
    typedef Value* pointer;
    typedef typename std::iterator_traits<Iter>::difference_type difference_type;
    typedef typename std::iterator_traits<Iter>::iterator_category iterator_category;

    explicit downcast_iterator(const Iter& b, const Iter& e) :
        cur(b), end(e) {
      while(cur!=end&&type_number<Value>::number!=(*cur)->__get_dynamic_type_number()) {
        ++cur;
      }
    }

    explicit downcast_iterator(const Iter& b, Iter&& e) :
        cur(b), end(std::move(e)) {
      while(cur!=end&&type_number<Value>::number!=(*cur)->__get_dynamic_type_number()) {
        ++cur;
      }
    }

    explicit downcast_iterator(Iter&& b, const Iter& e) :
        cur(std::move(b)), end(e) {
      while(cur!=end&&type_number<Value>::number!=(*cur)->__get_dynamic_type_number()) {
        ++cur;
      }
    }

    explicit downcast_iterator(Iter&& b, Iter&& e) :
        cur(std::move(b)), end(std::move(e)) {
      while(cur!=end&&type_number<Value>::number!=(*cur)->__get_dynamic_type_number()) {
        ++cur;
      }
    }

    downcast_iterator(const downcast_iterator& rhs) :
        cur(rhs.cur), end(rhs.end) {
    }

    downcast_iterator(downcast_iterator&& rhs) :
        cur(std::move(rhs.cur)), end(std::move(rhs.end)) {
    }

    downcast_iterator& operator=(const downcast_iterator& rhs) {
      if(&this!=rhs) {
        cur = rhs.cur;
        end = rhs.end;
      }
      return *this;
    }

    downcast_iterator& operator=(downcast_iterator&& rhs) {
      if(&this!=rhs) {
        cur = std::move(rhs.cur);
        end = std::move(rhs.end);
      }
    }

    friend bool operator==(const downcast_iterator& lhs, const downcast_iterator& rhs) {
      return lhs.cur==rhs.cur&&lhs.end==rhs.end;
    }

    friend bool operator!=(const downcast_iterator& lhs, const downcast_iterator& rhs) {
      return !(lhs==rhs);
    }

    reference operator*() const {
      casted = (type_number<Value>::number==(*cur)->__get_dynamic_type_number())?static_cast<Value>(*cur):nullptr;
      return casted;
    }

    pointer operator->() const {
      return &*this;
    }

    downcast_iterator& operator++() {
      do {
        ++cur;
      } while(cur!=end&&type_number<Value>::number!=(*cur)->__get_dynamic_type_number());
      return *this;
    }

    downcast_iterator operator++(int) {
      downcast_iterator<Value, Iter> tmp = *this;
      ++*this;
      return tmp;
    }

    unique_number __get_dynamic_type_number() const {
      return type_number<downcast_iterator>::number;
    }

  private:
    Iter cur, end;
    mutable Value casted;
  };

  template<class Value, class Container> class downcasted_multi_selection {
  public:
    typedef Value value_type;
    typedef downcast_iterator<Value, typename Container::const_iterator> const_iterator;
    downcasted_multi_selection(const Container &ct) :
        cont(ct) {
    }
    const_iterator begin() const {
      return downcast_iterator<Value, typename Container::const_iterator>(cont.begin(), cont.end());
    }
    const_iterator end() const {
      return downcast_iterator<Value, typename Container::const_iterator>(cont.end(), cont.end());
    }
  private:
    const Container& cont;
  };

  template<class Value, class Container>
  inline downcasted_multi_selection<Value, Container> downcasted_chain(const Container& ct) {
    return downcasted_multi_selection<Value, Container>(ct);
  }
}
#endif
