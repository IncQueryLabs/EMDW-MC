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
	test2();
}

void test1(){
	::std::cout << ::std::endl << "************************HACKING ATTEMPT TEST************************" << ::std::endl;
	::PhoneX::PhoneX::Implementation::Call call;
	::PhoneX::PhoneX::PhoneX* comp = new ::PhoneX::PhoneX::PhoneX();

	call.perform_initialization();
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callrcvd_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callerbusyorunknown_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::Callerverifiedandsynced_event());
	call.generate_external_event(new ::PhoneX::PhoneX::Implementation::Call::_Call_termination_event());

	for (int i = 0; i < 3; ++i) {
		comp->process();
	}
}

void test2(){
	::std::cout << ::std::endl << "************************SUCCESSFUL CALL TEST************************" << ::std::endl;
	::PhoneX::PhoneX::Implementation::Call call;
	::PhoneX::PhoneX::PhoneX* comp = new ::PhoneX::PhoneX::PhoneX();

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
