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

	call._comp = comp;
	call.perform_initialization();
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Callrcvd_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Callerbusyorunknown_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Callerverifiedandsynced_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::_Call_termination_event(false));

	for (int i = 0; i < 3; ++i) {
		comp->process();
	}

	delete comp;
}

void test2(){
	::std::cout << ::std::endl << "************************SUCCESSFUL CALL TEST************************" << ::std::endl;
	::PhoneX::PhoneX::Implementation::Call call;
	::PhoneX::PhoneX::PhoneX* comp = new ::PhoneX::PhoneX::PhoneX();

	call._comp = comp;
	call.perform_initialization();
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Callrcvd_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Callerverifiedandsynced_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Calledverifiedandsynced_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Callrequestaccepted_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Endcallrcvd_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Calledverifiedandsynced_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::Callerverifiedandsynced_event(false));
	call.generate_event(new ::PhoneX::PhoneX::Implementation::Call::_Call_termination_event(false));

	for (int i = 0; i < 7; ++i) {
		comp->process();
	}

	delete comp;
}
