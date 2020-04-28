# Test benches
Your project will be tested against two test benches: 
-   `Quad_4_bit_counter_tb.vhd`
-   `Display_tb.vhd`

Additionally, test benches to check the behaviour of your counter, clock divider and decoder modules are also available:
-	`decoder_2_to_4_tb.vhd`
-	`clock_divider_1k_tb.vhd`

You can use any of these test benches yourself to evaluate your progress.
Note that you will also need to write a test bench of your own. This should be a little easier to accomplish as you now have several examples to dissect.

## Clock Divider Testbench
This testbench is designed to test the 1kHz clock divider.

<img alt="Clock Divider Ports" src="https://storage.googleapis.com/enle373students/clockdivider-port.png" width="500" height="auto"/>

This testbench expects an entity named `my_divider_1k` with a 100MHz input clock and tests if a 1kHz signal is generated.

This testbench also demonstrates a method of making a clock signal within a test bench. However, this cannot be used outside test benches as `wait for X` is not a synthesizable statement. 
This testbench, unlike the one below, doesn't use `assert` statements – there is more information about these in the [Jargon](#Jargon) section – this means that when you run a synthesis you will be given a graphed response within the Vivado simulator.

## 2 to 4 Decoder Testbench
This testbench is designed to test the 2 to 4 decoder that controls the anode selection for the four rightmost displays.

<img alt="Decoder Ports" src="https://storage.googleapis.com/enle373students/2-4-decoder-port.png" width="600" height="auto"/>

This test bench expects an entity called `decoder_2_to_4` with a two bit selection vector and a four bit output anode vector. This two bit vector represents the number for the active display, e.g. "00" for the first display, "01" for the second display, and so on.

## Display Testbench
This testbench is designed to test the display module for your reaction timer, the skeleton for this file is found [here](../sources/Display_Wrapper.vhd)

<img alt="File structure" src="https://storage.googleapis.com/enle373students/display_tb-extract.png" width="600" height="auto"/>
The above is an extract from the [Display testbench](Display_tb.vhd). 

After set up, the test bench waits for the first anode to become high.
If the anode does not go high after four clock cycles, an error is thrown.
Once the first anode is high the values of the segment cathodes are checked to see that the digit `1` is displayed.
The test bench then waits for the second anode to go high. Because the order in which the anodes are activated is not specified, the test bench may have to wait for up to three more clock cycles for this to happen.
Once the second anode is high, the values on the segment cathodes are checked again: this time `2` is displayed.
The test bench then cycles through until the third anode is high and checks that the segment cathodes are displaying `3`; after this the fourth anode is checked and the segments’ ability to display `4` is tested.

If the test bench gets to this point successfully we can have confidence that the anodes are cycling correctly, hence no more asserts are run on the anodes themselves. Instead, the segment cathodes are checked for their ability to display the digits `5`, `6`, `7`, `8`, `9` and `0`. The test bench does not check if the segments can display a blank character, ` `, although you may be interested in implementing this ability in your own code.

Note that the test bench will fail and quit if any of the anodes do not go high at least once every four clock cycles. The test bench will display an error if any of the numbers are displayed incorrectly, but it will keep running. This behaviour is managed by [asserts](#Assert).

## Quad four bit counter testbench

This testbench is designed to test your four, four bit counters.

<img alt="File structure" src="https://storage.googleapis.com/enle373students/quad-four-bit-port.png" width="600" height="auto"/>

This test bench expects an entity named `Quad_4_bit_counter` with the port shown above.
-   `EN` is enable
-   `R_SET` is to reset the counters
-   `stage_X_q_out` is the 4 bit output of each of the counters
-   `clk_in_ctr` is the clock input for the part
-   `overflow` is the carry out for the counters after they exceed `9999`

This testbench also uses files, more information on this can be found is the [files](#files) section below.

## Jargon
A Glossary of the test bench code used:

### Assert
-   [VHDL Reference Manual](http://www.vhdl.renerta.com/source/vhd00007.htm)

This is used in test benches to more quickly see which of your tests are failing. Although the simulation graphs are nice, this allows you to immediately see which test failed with out having to look through the graphs to check if everything is ok. 

#### Report
The report component allows you to control the output statement when the assert fails. eg. "Output is not high after button press".

#### Example

<img alt="File structure" src="https://storage.googleapis.com/enle373students/assert-example.png" width="600" height="auto"/>

This will cause the simulation to report the message: `Output should be '010' (2)` if `binary_num` does not equal `010`

### Files
-   [VHDL Reference Manual](https://www.ics.uci.edu/~jmoorkan/vhdlref/filedec.html)

Files allow you to read and write data in VHDL to files.

#### Example
<img alt="Function Example" src="https://storage.googleapis.com/enle373students/files-example.png" width="600" height="auto"/>

Above is an example from the [Quad for bit decoder testbench](Quad_4_bit_counter_tb.vhd)

In this example a file named `counter_input.txt` is being read in this file can be found [here](counter_input.txt).
The vectors found within the files are then written into the the `check` vector eg. the first vector:
`0000000000000000010` enables the `R_SET` line as `check(1)` is `1`, the second enables the enable line. 

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
