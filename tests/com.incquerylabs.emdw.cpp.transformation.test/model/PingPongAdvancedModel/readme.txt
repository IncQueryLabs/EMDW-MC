******************************
  PING-PONG ADVANCED EXAMPLE
******************************

Running the c++ code
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
The generated code can be built and run, but the generated main function is
empty, and will not do anything. If you want to test the functionality of
the code generated for the model, copy the `main.cc` found in this example
project into the `src` folder of the generated project, and overwrite the
generated `main.cc` file.


Description
¯¯¯¯¯¯¯¯¯¯¯
The ping-pong advanced example model contains a component and three classes
(`Ping`, `Pong` and `Manager`) inside it. The `Ping` and `Pong` classes have an
association between them, and both of them are stateful classes meaning they
have a statemachine describing their behavior. The `Manager` class has 
multiple attributes and associations to demonstrate the code generated for
different types of containers. The containing component is an active component,
which can schedule the event processing of the contained stateful classes.

The `Ping` class defines two event types:
  * `BaseSignal`, which contains a String property `myString`
  * `DerivedSignal`, which is derived from the `BaseSignal`, and contains
    an Integer property `count`.

If one of the Ping-Pong classes recieves a `DerivedSignal` event, it copies
the recieved event, increases the event's `count` property by one, and appends
an 's' character to the `myString` property, if the `count` is divisible by ten.
The new event is then sent to the other class.

The classes are instantiated, and the association is set between the objects
in the supplied `main.cc` file. The component's event scheduler is also called
from this file.
