#ifndef __XUMLRT_RUNTIME_TYPE_NUMBER_HH
#define __XUMLRT_RUNTIME_TYPE_NUMBER_HH


#include "unique_number.hh"

namespace xumlrt {
  template<class C>
  class type_number {
  public:
    static unique_number number;
  };
  
  
  // this is needed to actually have a "storage" for the object
  template<class C> unique_number type_number<C>::number;
  
  // needed when RTT is not available
  template<class C, class D> C dynamic_type_number_based_cast(D *d) {
    return (type_number<C>::number==d->__get_dynamic_type_number())?static_cast<C>(d):0;
  }
}

#endif
