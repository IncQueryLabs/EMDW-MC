#ifndef __XUMLRT_RUNTIME_EVENT_HH_
#define __XUMLRT_RUNTIME_EVENT_HH_

namespace xumlrt {
  class event {
  public:
  	event(int id) :
      _id(id) {
    }
  
    virtual ~event() {}
    virtual event* clone() const {
      return new event(*this);
    }
  
    int _id;
  private:
    event& operator=(const event&);
  };
}

#endif
