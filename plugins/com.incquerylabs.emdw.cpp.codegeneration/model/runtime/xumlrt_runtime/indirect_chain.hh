#ifndef __XTUML__INDIRECT_CHAIN_HH
#define __XTUML__INDIRECT_CHAIN_HH

#include <iterator>
#include <utility>

#include "type_number.hh"

namespace xtuml {
  template<class Value, class Iter, class Member>
  class indirect_iterator: public std::iterator<std::forward_iterator_tag, Value> {
  public:
    typedef const Value& reference;
    typedef Value* pointer;
    
    explicit indirect_iterator(const Iter& b, const Iter& e, Value Member::*const r):
      cur(b), end(e), remote(r) {}

    explicit indirect_iterator(const Iter& b, Iter&& e, Value Member::*const r):
      cur(b), end(std::move(e)), remote(r) {}

    explicit indirect_iterator(Iter&& b, const Iter& e, Value Member::*const r):
      cur(std::move(b)), end(e), remote(r) {}

    explicit indirect_iterator(Iter&& b, Iter&& e, Value Member::*const r):
      cur(std::move(b)), end(std::move(e)), remote(r) {}

    indirect_iterator(const indirect_iterator &idi):
      cur(idi.cur), end(idi.end), remote(idi.remote) {}

    indirect_iterator(indirect_iterator &&idi):
      cur(std::move(idi.cur)), end(std::move(idi.end)), remote(idi.remote) {
      idi.remote = nullptr;
    }

    indirect_iterator& operator=(const indirect_iterator& idi) {
      cur = idi.cur;
      end = idi.end;
      remote = idi.remote;
      return *this;
    }
    
    indirect_iterator& operator=(indirect_iterator&& idi) {
      cur = std::move(idi.cur);
      end = std::move(idi.end);
      remote = idi.remote;
      idi.remote = nullptr;
      return *this;
    }

    friend bool operator==(const indirect_iterator& i,
                           const indirect_iterator& j) {
      return i.cur==j.cur&&i.end==j.end&&i.remote==j.remote;
    }
    
    friend bool operator!=(const indirect_iterator& i,
                           const indirect_iterator& j) {
      return !(i==j);
    }
    
    reference operator*() const {
      return (*cur)->*remote;
    }
    
    pointer operator->() const {
      return (&*cur)->*remote;
    }
    
    indirect_iterator& operator++() {
      while(++cur!=end&&(*cur)->*remote==nullptr) {}
      return *this;
    }
    
    indirect_iterator operator++(int) {
      indirect_iterator tmp = *this;
      ++*this;
      return tmp;
    }
    
    unique_number __get_dynamic_type_number() const { return type_number<indirect_iterator>::number; }

  private:
    Iter cur, end;
    Value Member::*remote;
  };

  template<class Value, class Container, class Member> class indirect_multi_selection {
  public:
    typedef Value value_type;
    typedef indirect_iterator<Value, typename Container::const_iterator, Member> const_iterator;
    indirect_multi_selection(const Container &ct, Value Member::*const rm): cont(ct), remote(rm) {}
    const_iterator begin() const {
       return indirect_iterator<Value, typename Container::const_iterator, Member>(cont.begin(), cont.end(), remote);
    }
    const_iterator end() const {
       return indirect_iterator<Value, typename Container::const_iterator, Member>(cont.end(), cont.end(), remote);
    }
  private:
    const Container &cont;
    Value Member::*const remote;
  };

  template<class Value, class Container, class Member>
  inline indirect_multi_selection<Value, Container, Member> indirect_chain(const Container &ct, Value Member::*const rm) {
    return indirect_multi_selection<Value, Container, Member>(ct, rm);
  }
}

#endif
