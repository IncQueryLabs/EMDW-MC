#ifndef __XUMLRT__UPCASTED_CHAIN_HH
#define __XUMLRT__UPCASTED_CHAIN_HH

#include <iterator>
#include <utility>

#include "type_number.hh"

namespace xumlrt {
  template<class Value, class Iter>
  class upcast_iterator: public std::iterator<std::forward_iterator_tag, Value> {
  public:
    typedef Value value_type;
    typedef const Value& reference;
    typedef Value* pointer;
    typedef typename std::iterator_traits<Iter>::difference_type difference_type;
    typedef typename std::iterator_traits<Iter>::iterator_category iterator_category;

    explicit upcast_iterator(const Iter& b, const Iter& e) :
        cur(b), end(e) {
    }

    explicit upcast_iterator(const Iter& b, Iter&& e) :
        cur(b), end(std::move(e)) {
    }

    explicit upcast_iterator(Iter&& b, const Iter& e) :
        cur(std::move(b)), end(e) {
    }

    explicit upcast_iterator(Iter&& b, Iter&& e) :
        cur(std::move(b)), end(std::move(e)) {
    }

    upcast_iterator(const upcast_iterator& rhs) :
        cur(rhs.cur), end(rhs.end) {
    }

    upcast_iterator(upcast_iterator&& rhs) :
        cur(std::move(rhs.cur)), end(std::move(rhs.end)) {
    }

    upcast_iterator& operator=(const upcast_iterator& rhs) {
      if(&this!=rhs) {
        cur = rhs.cur;
        end = rhs.end;
      }
    }

    upcast_iterator& operator=(upcast_iterator&& rhs) {
      if(&this!=rhs) {
        cur = std::move(rhs.cur);
        end = std::move(rhs.end);
      }
    }

    friend bool operator==(const upcast_iterator& lhs, const upcast_iterator& rhs) {
      return lhs.cur==rhs.cur&&lhs.end==rhs.end;
    }

    friend bool operator!=(const upcast_iterator& lhs, const upcast_iterator& rhs) {
      return !(lhs==rhs);
    }

    reference operator*() const {
      casted = static_cast<Value>(*cur);
      return casted;
    }

    pointer operator->() const {
      return &*this;
    }

    upcast_iterator& operator++() {
      ++cur;
      return *this;
    }

    upcast_iterator operator++(int) {
      upcast_iterator<Value, Iter> tmp = *this;
      ++*this;
      return tmp;
    }

    unique_number __get_dynamic_type_number() const {
      return type_number<upcast_iterator>::number;
    }

  private:
    Iter cur, end;
    mutable Value casted;
  };

  template<class Value, class Container> class upcasted_multi_selection {
  public:
    typedef Value value_type;
    typedef upcast_iterator<Value, typename Container::const_iterator> const_iterator;
    upcasted_multi_selection(const Container &ct) :
        cont(ct) {
    }
    const_iterator begin() const {
      return upcast_iterator<Value, typename Container::const_iterator>(cont.begin(), cont.end());
    }
    const_iterator end() const {
      return upcast_iterator<Value, typename Container::const_iterator>(cont.end(), cont.end());
    }
  private:
    const Container& cont;
  };

  template<class Value, class Container>
  inline upcasted_multi_selection<Value, Container> upcasted_chain(const Container& ct) {
    return upcasted_multi_selection<Value, Container>(ct);
  }
}
#endif
