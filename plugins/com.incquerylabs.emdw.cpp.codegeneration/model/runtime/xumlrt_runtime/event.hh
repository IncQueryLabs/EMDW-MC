#ifndef __XUMLRT_RUNTIME_EVENT_HH_
#define __XUMLRT_RUNTIME_EVENT_HH_

#include "xumlrt_runtime/unique_number.hh"
#include "xumlrt_runtime/type_number.hh"

namespace xumlrt {
  class event {
  public:
    // Type id getters
    static ::xumlrt::unique_number __get_static_type_number() { return ::xumlrt::type_number<::xumlrt::event>::number; }
    virtual ::xumlrt::unique_number __get_dynamic_type_number() const { return __get_static_type_number(); }
  
    virtual ~event() {}
    virtual event* clone() const {
      return new event(*this);
    }
  private:
    event& operator=(const event&);
  };
}

#endif
