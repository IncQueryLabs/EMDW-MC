/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
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
