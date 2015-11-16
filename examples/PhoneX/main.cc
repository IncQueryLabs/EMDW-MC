/******************************************************************************
 * 
 * M A I N
 * 
 * NAME: main
 * 
 ******************************************************************************/


#include "PhoneX/PhoneX/PhoneX_def.hh"

void test1();
void test2();

int main(int , char **) {
	// Test with hacking attempt
	test1();
	// Test with successful call
//	test2();
}

void test1(){
	::std::cout << ::std::endl << "************************ TEST 1 ************************" << ::std::endl;

	::PhoneX::PhoneX::Implementation::PhoneXPort_In port_in;
	::PhoneX::PhoneX::Implementation::PhoneXPort_Out port_out;
	::PhoneX::PhoneX::Implementation::DBPort_In dbport_in;
	::PhoneX::PhoneX::Implementation::DBPort_Out dbport_out;
	::PhoneX::PhoneX::Implementation::Service service;
	::PhoneX::PhoneX::Implementation::Test1 test1;
	::PhoneX::PhoneX::PhoneX* comp = ::PhoneX::PhoneX::PhoneX::get_instance();

	test1.perform_initialization();

	for (int i = 0; i < 100; ++i) {
		comp->process();
	}

	::std::cout << ::std::endl << "************************ TEST 1 finish ****************" << ::std::endl;

}

void test2(){
	::std::cout << ::std::endl << "************************ TEST 2 ************************" << ::std::endl;
	::PhoneX::PhoneX::Implementation::PhoneXPort_In port_in;
	::PhoneX::PhoneX::Implementation::PhoneXPort_Out port_out;
	::PhoneX::PhoneX::Implementation::DBPort_In dbport_in;
	::PhoneX::PhoneX::Implementation::DBPort_Out dbport_out;
	::PhoneX::PhoneX::Implementation::Service service;
	::PhoneX::PhoneX::Implementation::Test2 test2;
	::PhoneX::PhoneX::PhoneX* comp = ::PhoneX::PhoneX::PhoneX::get_instance();

	test2.perform_initialization();

	for (int i = 0; i < 100; ++i) {
		comp->process();
	}
	::std::cout << ::std::endl << "************************ TEST 2 finish *****************" << ::std::endl;
}

void old_test1(){
	::std::cout << ::std::endl << "************************ TEST 2 ************************" << ::std::endl;
	::PhoneX::PhoneX::Implementation::Call call;
	::PhoneX::PhoneX::PhoneX* comp = ::PhoneX::PhoneX::PhoneX::get_instance();

	call.perform_initialization();
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callrcvd_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callerbusyorunknown_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callerverifiedandsynced_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::_Call_termination_event());

	for (int i = 0; i < 100; ++i) {
		comp->process();
	}
}

void old_test2(){
	::std::cout << ::std::endl << "************************SUCCESSFUL CALL TEST************************" << ::std::endl;
	::PhoneX::PhoneX::Implementation::Call call;
	::PhoneX::PhoneX::PhoneX* comp = ::PhoneX::PhoneX::PhoneX::get_instance();

	call.perform_initialization();
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callrcvd_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callerverifiedandsynced_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Calledverifiedandsynced_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callrequestaccepted_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Endcallrcvd_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Calledverifiedandsynced_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callerverifiedandsynced_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::_Call_termination_event());

	for (int i = 0; i < 7; ++i) {
		comp->process();
	}
}
