#ifndef __XUMLRT__MERGED_CHAIN_HH
#define __XUMLRT__MERGED_CHAIN_HH

#include <iterator>
#include <utility>

#include "type_number.hh"

namespace xumlrt {
  template<class Value, class Iter, class Member, class Remote>
  class merge_iterator: public std::iterator<std::forward_iterator_tag, Value> {
  public:
    typedef const Value& reference;
    typedef Value* pointer;

    explicit merge_iterator(const Iter& b, const Iter& e, Remote Member::*const r):
      cur(b), end(e), remote(r) {
      if(cur!=end) {
        rcur = (&**cur->*remote).begin();
      }
    }

    explicit merge_iterator(const Iter& b, Iter&& e, Remote Member::*const r):
      cur(b), end(std::move(e)), remote(r) {
      if(cur!=end) {
        rcur = (&**cur->*remote).begin();
      }
    }

    explicit merge_iterator(Iter&& b, const Iter& e, Remote Member::*const r):
      cur(std::move(b)), end(e), remote(r) {
      if(cur!=end) {
        rcur = (&**cur->*remote).begin();
      }
    }

    explicit merge_iterator(Iter&& b, Iter&& e, Remote Member::*const r):
      cur(std::move(b)), end(std::move(e)), remote(r) {
      if(cur!=end) {
        rcur = (&**cur->*remote).begin();
      }
    }

    merge_iterator(const merge_iterator& rhs):
      cur(rhs.cur), end(rhs.end), remote(rhs.remote), rcur(rhs.rcur) {}

    merge_iterator(merge_iterator&& rhs):
      cur(std::move(rhs.cur)), end(std::move(rhs.end)), remote(rhs.remote), rcur(std::move(rhs.rcur)) {
        rhs.remote = nullptr;
      }

    merge_iterator& operator=(const merge_iterator& rhs) {
      cur = rhs.cur;
      end = rhs.end;
      remote = rhs.remote;
      rcur = rhs.rcur;
      return *this;
    }

    merge_iterator& operator=(merge_iterator&& rhs) {
      cur = std::move(rhs.cur);
      end = std::move(rhs.end);
      remote = rhs.remote;
      rhs.remote = nullptr;
      rcur = std::move(rhs.rcur);
      return *this;
    }

    friend bool operator==(const merge_iterator& lhs,
                           const merge_iterator& rhs) {
      if(lhs.cur!=lhs.end&&rhs.cur!=rhs.end) {
        return lhs.cur==rhs.cur&&lhs.rcur==rhs.rcur;
      } else {
        return lhs.cur==rhs.cur;
      }
    }

    friend bool operator!=(const merge_iterator& lhs,
                           const merge_iterator& rhs) {
      return !(lhs==rhs);
    }

    reference operator*() const {
      return *rcur;
    }

    pointer operator->() const {
      return &*rcur;
    }

    merge_iterator& operator++() {
      if(++rcur==(&**cur->*remote).end()) {
        while(++cur!=end&&(rcur = (&**cur->*remote).begin())==(&**cur->*remote).end()) {}
      }
      return *this;
    }

    merge_iterator operator++(int) {
      merge_iterator tmp = *this;
      ++*this;
      return tmp;
    }

    unique_number __get_dynamic_type_number() const { return type_number<merge_iterator>::number; }

  private:
    Iter cur, end;
    Remote Member::*remote;
    typename Remote::const_iterator rcur;
  };

  template<class Value, class Container, class Member, class Remote>
  class merged_multi_selection {
  public:
     typedef Value value_type;
     typedef merge_iterator<Value, typename Container::const_iterator, Member, Remote> const_iterator;
     merged_multi_selection(const Container &ct, Remote Member::*const rm): cont(ct), remote(rm) {}
     const_iterator begin() const {
        return merge_iterator<Value, typename Container::const_iterator, Member, Remote>(cont.begin(), cont.end(), remote);
     }
     const_iterator end() const {
        return merge_iterator<Value, typename Container::const_iterator, Member, Remote>(cont.end(), cont.end(), remote);
     }
  private:
    const Container &cont;
    Remote Member::*remote;
  };

  template<class Value, class Container, class Member, class Remote>
  inline merged_multi_selection<Value, Container, Member, Remote> merged_chain(const Container &ct, Remote Member::*const rm) {
    return merged_multi_selection<Value, Container, Member, Remote>(ct, rm);
  }
}

#endif
