# Test benches
These are all of the test benches that your project will be tested against. 
They will be `.vhd` files, but these ones are only for use in simulation, unlike the ones in the sources folder.
-   `clock_divider_1k_tb.vhd`
-   `decoder_2_to_4_tb.vhd`
-   `FSM_countdown.vhd`

We will be testing each of your modules individually with these test benches. This means you have access to all of the test cases for testing your code against.
You are however, still expected to write one test bench of your own. This should be a little easier to accomplish as you now have several examples to dissect.

## Clock Divider Testbench
This testbench is designed to test the 1kHz clock divider.

<img alt="Clock Divider Ports" src="https://storage.googleapis.com/enle373students/clockdivider-port.png" width="500" height="auto"/>

This testbench expects an entity named `my_divider_1k` with a 100MHz input clock and tests if 1kHz signal
is generated.

This testbench also demonstrates a method of making a clock signal within a test bench. However, this cannot
be used outside test benches as `wait for X` is not a synthesizable statement. This testbench unlike the one below
doesn't use `assert` statements which this is more information about in the [Jargon](#Jargon) section, this means that when you run a synthesis you will be given a graphed response within the Vivado simulator.

## 2 to 4 Decoder Testbench
This testbench is designed to test the 2 to 4 decoder that controls the anode selection for the four
rightmost displays.

<img alt="Decoder Ports" src="https://storage.googleapis.com/enle373students/2-4-decoder-port.png" width="600" height="auto"/>

This test bench expects a entity called `decoder_2_to_4` with a two bit selection vector and a four bit output anode 
vector. This two bit vector represents the number for the a active screen eg. "00" for the first display, "01" for
the second, etc.

## FSM Test bench
This test bench is designed to test a finite state machine that controls the decimal points countdown.

<img alt="File structure" src="https://storage.googleapis.com/enle373students/fsm_countdown-component.png" width="600" height="auto"/>

This test bench expects an entity called `FSM_countdown` with the above port. It will test that, with a 1Hz clock applied to the input one decimal point is removed every second 
then until all of the decimal points are turned off.


## Jargon
A Glossary of the test bench code used:

### Assert
-   [VHDL Reference Manual](http://www.vhdl.renerta.com/source/vhd00007.htm)

This is used in test benches to more quickly see which of your tests are failing. Although the simulation graphs are nice, this allows you to immediately see which test failed with out 
having to look through the graphs to check if everything is ok. 

#### Report
The report component allows you to control the output statement when the assert fails. eg. "Output is not high after button press".

#### Example

<img alt="File structure" src="https://storage.googleapis.com/enle373students/assert-example.png" width="600" height="auto"/>

This will cause the simulation to report the message: `Output should be '010' (2)` if `binary_num` does not equal `010`

### Functions
-   [VHDL Reference Manual](https://www.ics.uci.edu/~jmoorkan/vhdlref/function.html)

Functions are pretty much the same as you would expect. An example can be found in 
[decoder_2_to_4_tb.vhd](decoder_2_to_4_tb.vhd)

#### Example
<img alt="Function Example" src="https://storage.googleapis.com/enle373students/2-4-decoder-function.png" width="600" height="auto"/>

In this example the function has an input of `std_logic_vector` and returns a string. This particular function
takes the values of the `std_logic_vector` which can be '1' for a logic high, 'X' for high impedance etc. It then
takes those values and returns a character version of them within a string. For example if a input of [logic high, high impedance] the output would be '1X', this function is used in the test bench to help return a test result value.

### Procedures
-   [VHDL Reference Manual](https://www.ics.uci.edu/~jmoorkan/vhdlref/procedur.html)

Procedures allow you to avoid repeating code within your project, and unlike function do not have a direct return
value, instead deal with global signals and variables an example can be found in [decoder_2_to_4_tb.vhd](decoder_2_to_4_tb.vhd).

#### Example
<img alt="Function Example" src="https://storage.googleapis.com/enle373students/procedure%20example.png" width="900" height="auto"/>

This example basically abstracts the assert statement to make the final code easier to read, notice that unlike the 
function there is no return, procedures just effectively insert the statements within them into the process code.

## Author
Jos Craw <jcr124@uclive.ac.nz>
