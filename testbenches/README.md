# Test benches
These are all of the test benches that your project will be tested against. 
They will be `.vhd` files, but these ones are only for use in simulation, unlike the ones in the sources folder.
-   `FSM_countdown_tb.vhd`
-   `counter_tb.vhd`
-   `mux_20_to_5_tb.vhd`
-   `top_level_tb.vhd`

TODO: update testbench list with correct list of testbenches students are provided.
TODO: update to say that the students will make the testbench for the FSM we provide

We will be testing each of your modules individually with these test benches. This means you have access to all of the test cases for testing your code against.
You are however, still expected to write one test bench of your own. This should be a little easier to accomplish as you now have several examples to dissect.

## FSM Test bench
This test bench is designed to test a finite state machine that controls the decimal points countdown.

<img alt="File structure" src="https://storage.googleapis.com/enle373students/fsm_countdown-component.png" width="600" height="auto"/>

This test bench expects an entity called `FSM_countdown` with the above port. It will test that, with a 1Hz clock applied to the input one decimal point is removed every second 
then until all of the decimal points are turned off.


## Test Bench Jargon
A Glossary of the test bench code used:

### Assert
-   [VHDL Reference Manual](http://www.vhdl.renerta.com/source/vhd00007.htm)

This is used in test benches to more quickly see which of your tests are failing. Although the simulation graphs are nice, this allows you to immediatly see which test failed with out 
having to look through the graphs to check if everything is ok. 

#### Report
The report component allows you to control the output statement when the assert fails. eg. "Output is not high after button press".

#### Example

<img alt="File structure" src="https://storage.googleapis.com/enle373students/assert-example.png" width="600" height="auto"/>

This will cause the simulation to report the message: `Output should be '010' (2)` if `binary_num` does not equal `010`