# Sources

Keep all of your Vivado `.vhd` design sources inside this folder.

## Display_Wrapper.vhd
We have provided this skeleton file for you to place your original files in eg. BCD converter etc.
This module has the following port: 

<img alt="File structure" src="https://storage.googleapis.com/enle373students/display-wrapper-port.png" width="700" height="auto"/>

-   `CLK` is the 100MHz clock input
-   `Message` is a 16 bit vector representing the numbers on the displays, with four bit per display.
-   `CA-CG` are the display cathodes
-   `AN` is the display anodes

Having all of the display logic in one place allows you to keep the display logic separate from the logic of the
reaction timer, this will make debugging easier.