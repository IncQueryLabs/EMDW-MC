#ifndef __XUMLRT_RUNTIME_EVENT_HH_
#define __XUMLRT_RUNTIME_EVENT_HH_

namespace xumlrt {
  class event {
  public:
  	event(int id, bool isInternal) :
      _id(id), _isInternal(isInternal) {
    }
  
    virtual ~event() {}
    virtual event* clone() const {
      return new event(*this);
    }
  
    int _id;
    bool _isInternal;
  private:
    event& operator=(const event&);
  };
}

#endif
