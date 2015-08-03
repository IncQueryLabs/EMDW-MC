*************************
  CLIENT-SERVER EXAMPLE
*************************

Running the c++ code
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
The generated code can be built and run, but the generated main function is
empty, and will not do anything. If you want to test the functionality of
the code generated for the model, copy the `main.cc` found in this example
project into the `src` folder of the generated project, and overwrite the
generated `main.cc` file.


Description
¯¯¯¯¯¯¯¯¯¯
This example demonstrates the casting of incoming events to the lowest common
ancestor event type.

The client-server example model contains a component and two 
classes (`Client` and `Server`) inside it. The classes have an association 
between them, and both of them are stateful classes meaning they have a 
statemachine describing their behavior. The containing component is an 
active component, which can schedule the event processing of the contained 
stateful classes.

The `Server` defines four event types:
  * the `Request` event has an `id` Integer property
  * the `RequestAddition` event is derived from the `Request` event, and
    contains an `a` and a `b` Integer property
  * the `RequestMultiplication` event is also derived from the `Request` 
    event, and contains an `r1` and an `r2` Real property
  * the `Response` event contains an `id` Integer and a `result` Real property

If a `RequestAddition` or `RequestMultiplication` event arrives to the `Server`,
it calculates the result of the operation and sends a `Response` event with the
result and the same `id` as the request, then waits for an "ACK" message from the
`Client`. The "ACK" message is another `Response` event with the same id. 

The `Server` in the `WaitForAck` state can not differentiate between the incoming `Request`
types, it can only use the lowest common ancestor of the possible incoming events, 
which is the base `Request` event with an `id` property.

If another request arrives while waiting for the "ACK", the `Server` decides what to do based
on the ancestor event's `id` property. If it has the same id as the last request, it
resends the result to the `Client`, otherwise it ignores the new request.


The `Client` waits for a `Response` event, then starts its process:
  * sends a `RequestAddition` event and waits for the `Response`
  * sends an "ACK" message with a `Response` event
  * sends a `RequestMultiplication` event
  * sends another `RequestMultiplication` event before receiving the `Response`
  * after receiving the `Response`, sends another request with the same `id`
  * after receiving the resent `Response`, sends an "ACK" message with a `Response` event
