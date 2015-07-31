/******************************************************************************
 * 
 * C L I E N T   S E R V E R   E X A M P L E
 * 
 * NAME: main.cc
 * 
 ******************************************************************************/

#include "ClientServer/Component/Component_def.hh"

int main(int , char **) {
	using namespace ::ClientServer::Component;

	Client* client = new Client();
	Server* server = new Server();
	Component* comp = new Component();

	client->R1_server = server;
	server->R1_client = client;

	client->_comp = comp;
	server->_comp = comp;

	client->perform_initialization();
	server->perform_initialization();

	::ClientServer::Component::Server::Response_event* start_event = new ::ClientServer::Component::Server::Response_event(false);
	start_event->id = 1;
	client->generate_event(start_event);

	for (int i = 0; i < 50; ++i) {
	    comp->process();
	}

	delete client;
	delete server;
	delete comp;
}
