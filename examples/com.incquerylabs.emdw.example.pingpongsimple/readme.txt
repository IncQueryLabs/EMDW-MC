****************************
  PING-PONG SIMPLE EXAMPLE
****************************

Running the c++ code
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
The generated code can be built and run, but the generated main function is
empty, and will not do anything. If you want to test the functionality of
the code generated for the model, copy the `main.cc` found in this example
project into the `src` folder of the generated project, and overwrite the
generated `main.cc` file.


Description
¯¯¯¯¯¯¯¯¯¯¯
The ping-pong simple example model contains a component and two classes (`Ping`
and `Pong`) inside it. The classes have an association between them, and both
of them are stateful classes meaning they have a statemachine describing their
behavior. The containing component is an active component, which can schedule 
the event processing of the contained stateful classes.

Each class defines an event type it can recieve:
  * `Ping` can recieve `pong_s` events
  * `Pong` can recieve `ping_s` events

If one of the classes recieves the event it can handle, it changes its state
and sends an event to the other class, which will generate a new event, etc.

The classes are instantiated, and the association is set between the objects
in the supplied `main.cc` file. The component's event scheduler is also called
from this file.
