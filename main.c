/*
  Author: Michal Wolowik
  Corporation: VOLOVIQUE

  Date: Warsaw 20-VII-2015
  Destination: 
    Bootloader for Pic18fxxkxx devices

  File name:
    main.c

  File destination:
    Main destiny of current code is update flash
    conten using UART, USB, CAN medium and 
    Universal_Bootloader application on PC. More
    detail regarding to PC application refer to http:TBD

  Dependecies:
    Uart (UART 1 used with 9600br/8bits/no_parity/1stopbits/Asynchronous)
    CAN if available
    USB if available
    MCU Clock set to 64MHz
    Software heartbeat located on PB0 Led

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
    Application was tested on AVT-5275v2 development board.
 */




/*
 Standard ANSI C Library:
 */
#include <stdio.h>
#include <stdlib.h>




/*
 Specific Device Library:
 */
#include <pic18f26k80.h>




/*
 Configurations Bits Definitions:
 */
#include "config_bits.h"




/*
 Allowable XC8 types definitions
 */
#include "typedef.h"




/*
 Port Definitions:
 */
/* Heartbeat LED port definition */
#define LED LATBbits.LATB0




/*
 Bootloader specific
 */
/* Bootloader version definition */
#define VERSION "Boot_1.0.a"
/* One separately page size */
#define PAGE_SIZE 0x0040 /* 64 bytes page size */
/* In no character incoming after TIMEOUT go to user application*/
#define TIMEOUT 0x00001FFF




/*
 * Flash necessary defines definition
 */
/* Define where user application start */
#define APP_ENTRY 0x1000
/* Maximum amount of Flash */
#define FLASH_SIZE 0x10000
/* Flash block size */
#define FLASH_ERASE_BLOCK 64
/* Quantity 64 bytes flash block available for user application */
#define COUNTS_TO_ERASE_APP (FLASH_SIZE-APP_ENTRY) / FLASH_ERASE_BLOCK




/*
 * Universal Bootloader request command
 */
#define GET_BOOT_VER 0x10 /* Get bootloader version */
#define HEARTBEAT_INDICATOR 0x11 /* LED diode heartbeat indicator */
#define PAGE_SIZE_REQUEST 0x12 /* Page size / n-Dat quantity information */
#define MASS_FLASH_ERASE 0x13 /* Erase all flash pages */
#define DATA_FLASH_WRITE 0x14 /* Data and Flash Write */
#define ADDRESS_ALIGMENT 0x15 /* Address aligment factor */
#define JUMP_TO_APP 0x16 /* Jump to application */




/*
 * Universal Bootloader answer command
 */
#define BOOT_VER_STRING VERSION /* Bootloader version string */
#define PAGE_SIZE_VALUE PAGE_SIZE /* Specific microcontroller page size */
#define ADDRESS_ALIGMENT_VALUE 0x003F /* For Pic18fxxkxx devices */
#define ACKNOWLEDGE 0x12 /* When received proper request send acknowledge */




/*
 Global variables
 */
/* Buffer which is intended to contain bytes to be written in flash */
u8 gbuffer[PAGE_SIZE];



/* Timeout value - when reach TIMEOUT try to go to user application */
u32 timeout = 0x00000000;




/* Declare stack */
#pragma stack 0x200 255




/*
Function name   :   UART_init
Description     :   Function initalize UART 1 (9600, 8bit, 1stp, no parity)
Input 1         :   None
Output          :   None
Function return :   None
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static void UART_init(void);




/*
Function name   :   UART_putchar
Description     :   Function send character via UART
Input 1         :   u8: byte to send
Output          :   None
Function return :   None
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static void UART_putchar(u8 outchar);




/*
Function name   :   UART_getchar
Description     :   Function receive character acquired from UART if available
Input 1         :   u16 tout_val: Wait for character time
Output          :   None
Function return :   u8: Return recived byte from UART
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static u8 UART_getchar(u16 tout_val);




/*
Function name   :   send_string_uart
Description     :   Function send via UART string
Input 1         :   u8 *: string with at the end NULL character
Output          :   None
Function return :   None
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static void send_string_uart(u8 *buf);




/*
Function name   :   bootloader_state_machine
Description     :   Main state machine of bootloader - refer to algorithm
Input 1         :   u8: received byte
Output          :   None
Function return :   None
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static void bootloader_state_machine(u8 state);




/*
Function name   :   jump_to_app
Description     :   Function only jump to user application
Input 1         :   None
Output          :   None
Function return :   None
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static void jump_to_app(void);




/*
Function name   :   erase_flash
Description     :   Function erase 64bit blocks
Input 1         :   u32: block address
Output          :   None
Function return :   None
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static void erase_flash(u32 address);




/*
Function name   :   write_flash
Description     :   Function write data to flash
Input 1         :   u32: block address
Input 2         :   u8*: buffer with data to be written
Input 3         :   u8: quantity of data to be written
Output          :   None
Function return :   None
Testing result  :   Not tested yet
Test conditions :   AVT-5275v2 - MCU Clock 64MHz
Optymalization  :   For XC8 used - 'free'
Function valid  :   Function invalid - not tested yet
Function rev.   :   V1_0
Approved by     :   not approved yet
Issue date      :   20.VII.2015
Problem report  :   None
*/
static void write_flash(u32 address, u8 *buffer, u8 length);




void main(void)
{
    u32 hbeat = 0;

    /* Main Oscillator Configuration */

    /* Set Internal Oscillator Frequency to 16[MHz] */
    OSCCONbits.IRCF2 = 1;
    OSCCONbits.IRCF1 = 1;
    OSCCONbits.IRCF0 = 1;

    /* Set frequency stable bit */
    OSCCONbits.HFIOFS = 1;

    /* Enable Internal PLL x 4 - MCLK 64 [MHz] */
    OSCTUNEbits.PLLEN = 1;

    /* GPIO Ports Configuration */

    /* Heartbeat Led diode port configuration */
    TRISBbits.TRISB0 = 0;

    /* Initialize UART 1 - 9600, 8bits, 1stb, no parity */
    UART_init();
    
    /* Initialize receive buffer to 0xFF */
    for(hbeat=0; hbeat<PAGE_SIZE; hbeat++)
    {
        gbuffer[hbeat] = 0xFF;
    }
	
    /* Clear timeout value */
    timeout = 0x00000000;

    while(1){
        if(hbeat == 0x03F){
            LED = 1;
            hbeat++;
        }
        else if( hbeat == 0x1FF ){
            LED = 0;
            hbeat++;
        }
        else if (hbeat == 0x9FF){
            hbeat = 0x00;
        }
        else{			
            hbeat++;
        }
        bootloader_state_machine(UART_getchar(0xFF));
    }
}




static void UART_init(void)
{
    TRISCbits.TRISC6 = 0; /* TX pin set as output */
    TRISCbits.TRISC7 = 1; /* RX pin set as input */

    /* Don't calculate Baudrate just take value from user manual
     page 339. */

    /* Sync = 0, BRGH = 0, BRG16 = 0 FOSC = 64MHz */
    TXSTAbits.SYNC = 0;
    TXSTAbits.BRGH = 0;
    BAUDCON1bits.BRG16 = 0;
    SPBRG = 103;

    /* Serial Port Enable Transmission - ON */
    TXSTAbits.TXEN = 1;

    /* Serial Port Enable bit - ON */
    RCSTAbits.SPEN = 1;

    /* Continous Receive Enable bit - ON */
    RCSTAbits.CREN = 1;
}




static void UART_putchar(u8 outchar)
{
    while(!TXSTA1bits.TRMT);

    TXREG1 = outchar;

    while(!TXSTA1bits.TRMT);
}




static u8 UART_getchar(u16 tout_val)
{   
    u16 tout = 0x00000000;
    
    while(!PIR1bits.RCIF){
        if(tout == tout_val){
            return(0);
        }
        else{
            tout++;
        }
    }
    timeout = 0x00000000;
    if( (RCSTAbits.FERR == 1) || (RCSTAbits.OERR == 1) ){
        RCSTAbits.CREN = 0; /* Clear an error */
        RCSTAbits.CREN = 1; /* Start continous receiving again */
    }
    return((u8)RCREG1);
}




static void send_string_uart(u8 *buf)
{
    u8 i = 0x00;

    do{
        if(buf[i] != '\0'){
            UART_putchar(buf[i]);
        }
    }while(buf[i++] != '\0');
}




static void bootloader_state_machine(u8 state)
{
    u32 address = 0x00000000;
    u8 crc = 0x00;
	u32 adr = 0x00000000;
    
    switch (state)
    {
        case GET_BOOT_VER:{
            /* First send command - Boot Loader Version */
            UART_putchar(GET_BOOT_VER);
            send_string_uart((u8 *)BOOT_VER_STRING);
        break;
        }
        case HEARTBEAT_INDICATOR:{
            UART_putchar(ACKNOWLEDGE);
			state = 0;
        break;
        }
        case MASS_FLASH_ERASE:{
            for (adr = APP_ENTRY; adr < FLASH_SIZE; adr += FLASH_ERASE_BLOCK){
                erase_flash(adr);
            }
            UART_putchar(ACKNOWLEDGE);
        break;
        }
        case DATA_FLASH_WRITE:{
            address = (((u32)UART_getchar(0x7FFF))<<24);
            address |= (((u32)UART_getchar(0x7FFF))<<16);
            address |= (((u32)UART_getchar(0x7FFF))<<8);
            address |= ((u32)UART_getchar(0x7FFF));
            for (adr = 0; adr < PAGE_SIZE; adr++){
                gbuffer[adr] = UART_getchar(0x7FFF);
            }
            erase_flash(address);
            write_flash(address, gbuffer, PAGE_SIZE);
            UART_putchar(ACKNOWLEDGE);
        break;
        }
        case PAGE_SIZE_REQUEST:{
            crc = PAGE_SIZE_REQUEST;
            UART_putchar(PAGE_SIZE_REQUEST);
            crc += (u8)((PAGE_SIZE_VALUE&0xFF00)>>8);
            UART_putchar((u8)((PAGE_SIZE_VALUE&0xFF00)>>8));
            crc += (u8)(PAGE_SIZE_VALUE&0x00FF);
            UART_putchar((u8)(PAGE_SIZE_VALUE&0x00FF));
            UART_putchar(crc);
        break;
        }
        case ADDRESS_ALIGMENT:{
            crc = ADDRESS_ALIGMENT;
            UART_putchar(ADDRESS_ALIGMENT);
            crc += (u8)((ADDRESS_ALIGMENT_VALUE&0xFF00)>>8);
            UART_putchar((u8)((ADDRESS_ALIGMENT_VALUE&0xFF00)>>8));
            crc += (u8)(ADDRESS_ALIGMENT_VALUE&0x00FF);
            UART_putchar((u8)(ADDRESS_ALIGMENT_VALUE&0x00FF));
            UART_putchar(crc);
        break;
        }
        case JUMP_TO_APP:{
            UART_putchar(ACKNOWLEDGE);
            jump_to_app(); /* Jump to user application code */
        break;
        }
        default:{
            timeout++;
            if(timeout == TIMEOUT){
                jump_to_app(); /* Jump to user application code */
            }
        break;
        }
    }
}




static void jump_to_app(void)
{
    /* Before go to user application set all pheriperals to default */
    TRISBbits.TRISB0 = 0;
    
    RCON |= 0x93; /* Set all flags as just after reset */
	__asm
		goto APP_ENTRY
    __endasm;
}




static void erase_flash(u32 address)
{
    PIR4bits.EEIF = 0;

    TBLPTRL = (address) & 0xC0;
    TBLPTRH = (address >> 8) & 0xFF;
    TBLPTRU = (address >> 16) & 0xFF;

    /*
     * bit 7, EEPGD = 1, memory is flash (unimplemented on J PIC)
     * bit 6, CFGS  = 0, enable acces to flash (unimplemented on J PIC)
     * bit 5, WPROG = 0, enable single word write (unimplemented on non-J PIC)
     * bit 4, FREE  = 1, enable write operation (1 if erase operation)
     * bit 3, WRERR = 0,
     * bit 2, WREN  = 1, enable write to memory
     * bit 1, WR    = 0,
     * bit 0, RD    = 0, (unimplemented on J PIC)
     */

    EECON1 = 0x94; /* 0b10010100 */

    EECON2 = 0x55;          /* unlock sequence */
    EECON2 = 0xAA;          /* unlock sequence */
    EECON1bits.WR = 1;      /* start write or erase operation */

    INTCONbits.GIE = 1;

    while (!PIR4bits.EEIF);
    PIR4bits.EEIF = 0;
    EECON1bits.WREN = 0;
    EECON1bits.FREE = 0;    /* back to write operation */

    INTCONbits.GIE = 0;
}




static void write_flash(u32 address, u8 *buffer, u8 length)
{
    int counter;

    PIR4bits.EEIF = 0;

    TBLPTRL = (address) & 0xC0;
    TBLPTRH = (address >> 8) & 0xFF;
    TBLPTRU = (address >> 16) & 0xFF;

    /* The programming block is 32 bytes for all chips except x5k50 */
    /* The programming block is 64 bytes for x5k50 */

    /* Load max. 64 holding registers*/
    for (counter = 0; counter < length; counter++) {
      TABLAT = buffer[counter]; /* present data to table latch */
      /* write data in TBLWT holding register */
      /* TBLPTR is incremented after the read/write */
      __asm
          TBLWT*+
      __endasm;
    }

    /* One step back to be inside the 64 bytes range */
    __asm
        TBLRD*-
    __endasm;
    

    /* Start block write */
    /*
     * bit 7, EEPGD = 1, Flash Program or Data EEPROM Memory Select bit (1-Access Flash program memory)
     * bit 6, CFGS  = 0, Flash Program/Data EEPROM or Configure Select bit (0-Access Flash progrm or data EEPROM memory)
     * bit 5, -     = x, Bit unimplemented on PIC18Fxxkxx microcontrollers
     * bit 4, FREE  = 0, Flash Row Erase Enable bit (0-Performs write only)
     * bit 3, WRERR = 0, Flash Program/Data EEPROM Error flag bit (0-The write operation completed)
     * bit 2, WREN  = 1, Flash Program/Data EEPROM Write Enable bit (1-Allows write cycles to Flash program/data EEPROM) 
     * bit 1, WR    = 0, Write Control bit (0-Write cycle to the EEPROM is complete)
     * bit 0, RD    = 0, Read Control bit (0-Does not initiate an EEPROM read)
     */

    EECON1 = 0x84; /* 0b10000100 */

    INTCONbits.GIE = 0;

    EECON2 = 0x55;
    EECON2 = 0xAA;

    EECON1bits.WR = 1;  /* WR = 1; start write or erase operation */
                        /* WR cannot be cleared, only set, in software */
                        /* It is cleared in hardware at the completion */
                        /* of the write or erase operation */
                        /* CPU stall here for 2ms */

    INTCONbits.GIE = 1;

    while (!PIR4bits.EEIF);
    PIR4bits.EEIF = 0;
    EECON1bits.WREN = 0;
}




void interrupt_at_high_vector(void) __naked __interrupt 1 {
    __asm
    	goto APP_ENTRY + 0x0008
    __endasm;
}

void interrupt_at_low_vector(void) __naked __interrupt 2 {
    __asm
    	goto APP_ENTRY + 0x0018
    __endasm;
}