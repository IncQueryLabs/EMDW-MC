#ifndef __XUMLRT_RUNTIME_UNIQUE_NUMBER_HH
#define __XUMLRT_RUNTIME_UNIQUE_NUMBER_HH

namespace xumlrt {
  class unique_number {
  public:
    unique_number(): cur_id(max_id++) {}
    unique_number(const unique_number& id): cur_id(id.cur_id) {}
    unique_number& operator=(const unique_number& id) {
      cur_id = id.cur_id;
      return *this;
    }
  
    unsigned long getId(){
      return cur_id;
    }
  
    // friend: operator == and != should be usually defined outside
    friend bool operator==(const unique_number& ui1, const unique_number& ui2) {
      return ui1.cur_id==ui2.cur_id;
    }
    friend bool operator!=(const unique_number& ui1, const unique_number& ui2) {
      return ui1.cur_id!=ui2.cur_id;
    }
  private:
    static unsigned long max_id;
    unsigned long cur_id;
  };
}
#endif
