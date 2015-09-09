#ifndef __EXTERNALCLASS__EXTERNALCLASS__RANDOMNUMBERGENERATOR_HEADER
#define __EXTERNALCLASS__EXTERNALCLASS__RANDOMNUMBERGENERATOR_HEADER

#include <list> //<list> for _instances; 
#include <queue> //<queue> for event queues; 
#include <iostream> //<iostream> for standard io; 

namespace ExternalNamespace{
	class ExternalRandomNumberGenerator {
	public:
		ExternalRandomNumberGenerator();
		virtual ~ExternalRandomNumberGenerator();

		static long getRandomNumber();
		static void setRandomGeneratorParameter(long generatorParameter);
		static void refreshValue();
	private:
		static long last_val;

	}; /* class ExternalRandomNumberGenerator */
} /* namespace ExternalNamespace */

#endif /* __EXTERNALCLASS__EXTERNALCLASS__RANDOMNUMBERGENERATOR_HEADER */
