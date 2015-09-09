#include "ExternalRandomNumberGenerator.hh"

long ::ExternalNamespace::ExternalRandomNumberGenerator::last_val = 785;

// Constructors
::ExternalNamespace::ExternalRandomNumberGenerator::ExternalRandomNumberGenerator() {
	::std::cout << "[RandomNumberGenerator] constructor call" << ::std::endl;
}

// Destructor
::ExternalNamespace::ExternalRandomNumberGenerator::~ExternalRandomNumberGenerator() {
	::std::cout << "[RandomNumberGenerator] destructor call" << ::std::endl;
}

// Operation definitions
long (::ExternalNamespace::ExternalRandomNumberGenerator::getRandomNumber)() {
	::std::cout << "[RandomNumberGenerator] operation call: getRandomNumber()" << ::std::endl;
	::ExternalNamespace::ExternalRandomNumberGenerator::refreshValue();
	return ::ExternalNamespace::ExternalRandomNumberGenerator::last_val;
}

void (::ExternalNamespace::ExternalRandomNumberGenerator::setRandomGeneratorParameter)(long generatorParameter) {
	::std::cout << "[RandomNumberGenerator] operation call: setRandomGeneratorParameter(long generatorParameter)" << ::std::endl;
	::ExternalNamespace::ExternalRandomNumberGenerator::last_val = generatorParameter;
}

void (::ExternalNamespace::ExternalRandomNumberGenerator::refreshValue)() {
	::std::cout << "[RandomNumberGenerator] operation call: refreshValue()" << ::std::endl;
	::ExternalNamespace::ExternalRandomNumberGenerator::last_val =
				((::ExternalNamespace::ExternalRandomNumberGenerator::last_val + 37) * 197) % 271;
}
