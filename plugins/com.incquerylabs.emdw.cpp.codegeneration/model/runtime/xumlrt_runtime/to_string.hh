#ifndef __XUMLRT__TO_STRING_HH
#define __XUMLRT__TO_STRING_HH

#include <string>
#include <sstream>

namespace xumlrt
{
    template < typename T > 
    inline std::string to_string( const T& value )
    {
        ::std::ostringstream os;
        os << ::std::boolalpha << value ;
        return os.str() ;
    }
}
#endif