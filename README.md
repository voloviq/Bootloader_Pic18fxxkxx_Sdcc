Bootloader for Pic18fxxkxx devices
=========

Main destiny of current code is update flash
conten using UART, USB, CAN medium via 
Universal_Bootloader application on PC. More
detail regarding to PC application refer to http:TBD

### Hardware specification for this example
 - MCLR input pin must be connected to VDD.
 - An LED must be connected to pin PORTB0. LED anode must be connected to the pin through a ~330 ohm resistor and the LED cathode must be connected to GND.

### Notes
 - `OSCCONbits.IRCF2 = 1, OSCCONbits.IRCF1 = 1, OSCCONbits.IRCF0 = 1` selects internal oscillator as source for PLL which is set x4. Default frequency for this example is 64MHz.
 - User application should start from address 0x1000. Bootloader application reside from 0x0000 up to 0x0FFF.
