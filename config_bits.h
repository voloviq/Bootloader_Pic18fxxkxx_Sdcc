/*
  Author: Michal Wolowik
  Corporation: VOLOVIQUE
  Date: Warsaw 23-VII-2015
  Destination: 
    Configuration Bits for Pic18fxxkxx devices

  File name:
    config_bits.h

  File destination:
    Configure all available bits for Pic18fxxkxx devices

  Dependecies:
    No hardware dependencies

  Compiler:
    XC8 - version: v1.34 - in free mode

  GUI:
    MPLAB X IDE v3.06

  Documentation:
    PIC18F66K80FAMILY DS39977F Revision F Februrary 2012.

  Responsible:
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.
		
  Notes:
    This module don't need to be tested.
 */

#ifndef CONFIG_BITS_H
#define	CONFIG_BITS_H


#ifdef	__cplusplus
extern "C" {
#endif

/* PIC18FxxKxx Configuration Bit Settings */

/* CONFIG1L */
#pragma config RETEN = OFF      /* VREG Sleep Enable bit (Ultra low-power regulator is Disabled (Controlled by REGSLP bit))*/

#pragma config INTOSCSEL = HIGH /* LF-INTOSC Low-power Enable bit (LF-INTOSC in High-power mode during Sleep) */

#pragma config SOSCSEL = DIG    /* SOSC Power Selection and mode Configuration bits (High Power SOSC circuit selected) */

#pragma config XINST = OFF      /* Extended Instruction Set (Disabled) */


/* CONFIG1H */
#pragma config FOSC = INTIO2    /* Oscillator (Enable Internal oscilator) rest settings OSCCON */

#pragma config PLLCFG = ON      /* PLL x4 Enable bit (Disabled) due to OSCCON settings */

#pragma config FCMEN = ON       /* Fail-Safe Clock Monitor (Enabled) */

#pragma config IESO = OFF       /* Internal External Oscillator Switch Over Mode (Disabled) */


/* CONFIG2L */
#pragma config PWRTEN = OFF     /* Power Up Timer (Disabled) */

#pragma config BOREN = SBORDIS  /* Brown Out Detect (Enabled in hardware, SBOREN disabled) */

#pragma config BORV = 1         /* Brown-out Reset Voltage bits (2.7V) */

#pragma config BORPWR = ZPBORMV /* BORMV Power level (ZPBORMV instead of BORMV is selected) */


/* CONFIG2H */
#pragma config WDTEN = OFF      /* Watchdog Timer (WDT enabled in hardware; SWDTEN bit disabled) */

#pragma config WDTPS = 256      /* Watchdog Postscaler */


/* CONFIG3H */
#pragma config CANMX = PORTB    /* ECAN Mux bit (ECAN TX and RX pins are located on RB2 and RB3, respectively) */

#pragma config MSSPMSK = MSK7   /* MSSP address masking (7 Bit address masking mode) */

#pragma config MCLRE = ON       /* Master Clear Enable (MCLR Enable, RE3 Disable) */


/* CONFIG4L */
#pragma config STVREN = ON      /* Stack Overflow Reset (Enabled) */

#pragma config BBSIZ = BB2K     /* Boot Block Size (2K word Boot Block size) */


/* CONFIG5L */
#pragma config CP0 = OFF        /* Code Protect 00800-01FFF (Disabled) */

#pragma config CP1 = OFF        /* Code Protect 02000-03FFF (Disabled) */

#pragma config CP2 = OFF        /* Code Protect 04000-05FFF (Disabled) */

#pragma config CP3 = OFF        /* Code Protect 06000-07FFF (Disabled) */


/* CONFIG5H */
#pragma config CPB = OFF        /* Code Protect Boot (Disabled) */

#pragma config CPD = OFF        /* Data EE Read Protect (Disabled) */


/* CONFIG6L */
#pragma config WRT0 = OFF       /* Table Write Protect 00800-03FFF (Disabled) */

#pragma config WRT1 = OFF       /* Table Write Protect 04000-07FFF (Disabled) */

#pragma config WRT2 = OFF       /* Table Write Protect 08000-0BFFF (Disabled) */

#pragma config WRT3 = OFF       /* Table Write Protect 0C000-0FFFF (Disabled) */


/* CONFIG6H */
#pragma config WRTC = OFF       /* Config. Write Protect (Disabled) */

#pragma config WRTB = OFF       /* Table Write Protect Boot (Disabled) */

#pragma config WRTD = OFF       /* Data EE Write Protect (Disabled) */


/* CONFIG7L */
#pragma config EBTR0 = OFF      /* Table Read Protect 00800-03FFF (Disabled) */

#pragma config EBTR1 = OFF      /* Table Read Protect 04000-07FFF (Disabled) */

#pragma config EBTR2 = OFF      /* Table Read Protect 08000-0BFFF (Disabled) */

#pragma config EBTR3 = OFF      /* Table Read Protect 0C000-0FFFF (Disabled) */


/* CONFIG7H */
#pragma config EBTRB = OFF      /* Table Read Protect Boot (Disabled) */


#ifdef	__cplusplus
}
#endif

#endif	/* CONFIG_BITS_H */

