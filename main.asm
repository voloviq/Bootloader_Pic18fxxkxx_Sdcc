;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW32)
; This file was generated Wed Aug 19 19:58:20 2015
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f26k80
	radix	dec
	CONFIG	RETEN=OFF
	CONFIG	INTOSCSEL=HIGH
	CONFIG	SOSCSEL=DIG
	CONFIG	XINST=OFF
	CONFIG	FOSC=INTIO2
	CONFIG	PLLCFG=ON
	CONFIG	FCMEN=ON
	CONFIG	IESO=OFF
	CONFIG	PWRTEN=OFF
	CONFIG	BOREN=SBORDIS
	CONFIG	BORV=1
	CONFIG	BORPWR=ZPBORMV
	CONFIG	WDTEN=OFF
	CONFIG	WDTPS=256
	CONFIG	CANMX=PORTB
	CONFIG	MSSPMSK=MSK7
	CONFIG	MCLRE=ON
	CONFIG	STVREN=ON
	CONFIG	BBSIZ=BB2K
	CONFIG	CP0=OFF
	CONFIG	CP1=OFF
	CONFIG	CP2=OFF
	CONFIG	CP3=OFF
	CONFIG	CPB=OFF
	CONFIG	CPD=OFF
	CONFIG	WRT0=OFF
	CONFIG	WRT1=OFF
	CONFIG	WRT2=OFF
	CONFIG	WRT3=OFF
	CONFIG	WRTC=OFF
	CONFIG	WRTB=OFF
	CONFIG	WRTD=OFF
	CONFIG	EBTR0=OFF
	CONFIG	EBTR1=OFF
	CONFIG	EBTR2=OFF
	CONFIG	EBTR3=OFF
	CONFIG	EBTRB=OFF


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_stack
	global	_stack_end
	global	_gbuffer
	global	_timeout
	global	_main
	global	_interrupt_at_high_vector
	global	_interrupt_at_low_vector

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget1
	extern	_stdin
	extern	_stdout
	extern	_RXERRCNTbits
	extern	_TXERRCNTbits
	extern	_BRGCON1bits
	extern	_BRGCON2bits
	extern	_BRGCON3bits
	extern	_RXFCON0bits
	extern	_RXFCON1bits
	extern	_RXF6SIDHbits
	extern	_RXF6SIDLbits
	extern	_RXF6EIDHbits
	extern	_RXF6EIDLbits
	extern	_RXF7SIDHbits
	extern	_RXF7SIDLbits
	extern	_RXF7EIDHbits
	extern	_RXF7EIDLbits
	extern	_RXF8SIDHbits
	extern	_RXF8SIDLbits
	extern	_RXF8EIDHbits
	extern	_RXF8EIDLbits
	extern	_RXF9SIDHbits
	extern	_RXF9SIDLbits
	extern	_RXF9EIDHbits
	extern	_RXF9EIDLbits
	extern	_RXF10SIDHbits
	extern	_RXF10SIDLbits
	extern	_RXF10EIDHbits
	extern	_RXF10EIDLbits
	extern	_RXF11SIDHbits
	extern	_RXF11SIDLbits
	extern	_RXF11EIDHbits
	extern	_RXF11EIDLbits
	extern	_RXF12SIDHbits
	extern	_RXF12SIDLbits
	extern	_RXF12EIDHbits
	extern	_RXF12EIDLbits
	extern	_RXF13SIDHbits
	extern	_RXF13SIDLbits
	extern	_RXF13EIDHbits
	extern	_RXF13EIDLbits
	extern	_RXF14SIDHbits
	extern	_RXF14SIDLbits
	extern	_RXF14EIDHbits
	extern	_RXF14EIDLbits
	extern	_RXF15SIDHbits
	extern	_RXF15SIDLbits
	extern	_RXF15EIDHbits
	extern	_RXF15EIDLbits
	extern	_SDFLCbits
	extern	_RXFBCON0bits
	extern	_RXFBCON1bits
	extern	_RXFBCON2bits
	extern	_RXFBCON3bits
	extern	_RXFBCON4bits
	extern	_RXFBCON5bits
	extern	_RXFBCON6bits
	extern	_RXFBCON7bits
	extern	_MSEL0bits
	extern	_MSEL1bits
	extern	_MSEL2bits
	extern	_MSEL3bits
	extern	_BSEL0bits
	extern	_BIE0bits
	extern	_TXBIEbits
	extern	_B0CONbits
	extern	_B0SIDHbits
	extern	_B0SIDLbits
	extern	_B0EIDHbits
	extern	_B0EIDLbits
	extern	_B0DLCbits
	extern	_B0D0bits
	extern	_B0D1bits
	extern	_B0D2bits
	extern	_B0D3bits
	extern	_B0D4bits
	extern	_B0D5bits
	extern	_B0D6bits
	extern	_B0D7bits
	extern	_CANSTAT_RO9bits
	extern	_CANCON_RO9bits
	extern	_B1CONbits
	extern	_B1SIDHbits
	extern	_B1SIDLbits
	extern	_B1EIDHbits
	extern	_B1EIDLbits
	extern	_B1DLCbits
	extern	_B1D0bits
	extern	_B1D1bits
	extern	_B1D2bits
	extern	_B1D3bits
	extern	_B1D4bits
	extern	_B1D5bits
	extern	_B1D6bits
	extern	_B1D7bits
	extern	_CANSTAT_RO8bits
	extern	_CANCON_RO8bits
	extern	_B2CONbits
	extern	_B2SIDHbits
	extern	_B2SIDLbits
	extern	_B2EIDHbits
	extern	_B2EIDLbits
	extern	_B2DLCbits
	extern	_B2D0bits
	extern	_B2D1bits
	extern	_B2D2bits
	extern	_B2D3bits
	extern	_B2D4bits
	extern	_B2D5bits
	extern	_B2D6bits
	extern	_B2D7bits
	extern	_CANSTAT_RO7bits
	extern	_CANCON_RO7bits
	extern	_B3CONbits
	extern	_B3SIDHbits
	extern	_B3SIDLbits
	extern	_B3EIDHbits
	extern	_B3EIDLbits
	extern	_B3DLCbits
	extern	_B3D0bits
	extern	_B3D1bits
	extern	_B3D2bits
	extern	_B3D3bits
	extern	_B3D4bits
	extern	_B3D5bits
	extern	_B3D6bits
	extern	_B3D7bits
	extern	_CANSTAT_RO6bits
	extern	_CANCON_RO6bits
	extern	_B4CONbits
	extern	_B4SIDHbits
	extern	_B4SIDLbits
	extern	_B4EIDHbits
	extern	_B4EIDLbits
	extern	_B4DLCbits
	extern	_B4D0bits
	extern	_B4D1bits
	extern	_B4D2bits
	extern	_B4D3bits
	extern	_B4D4bits
	extern	_B4D5bits
	extern	_B4D6bits
	extern	_B4D7bits
	extern	_CANSTAT_RO5bits
	extern	_CANCON_RO5bits
	extern	_B5CONbits
	extern	_B5SIDHbits
	extern	_B5SIDLbits
	extern	_B5EIDHbits
	extern	_B5EIDLbits
	extern	_B5DLCbits
	extern	_B5D0bits
	extern	_B5D1bits
	extern	_B5D2bits
	extern	_B5D3bits
	extern	_B5D4bits
	extern	_B5D5bits
	extern	_B5D6bits
	extern	_B5D7bits
	extern	_CANSTAT_RO4bits
	extern	_CANCON_RO4bits
	extern	_RXF0SIDHbits
	extern	_RXF0SIDLbits
	extern	_RXF0EIDHbits
	extern	_RXF0EIDLbits
	extern	_RXF1SIDHbits
	extern	_RXF1SIDLbits
	extern	_RXF1EIDHbits
	extern	_RXF1EIDLbits
	extern	_RXF2SIDHbits
	extern	_RXF2SIDLbits
	extern	_RXF2EIDHbits
	extern	_RXF2EIDLbits
	extern	_RXF3SIDHbits
	extern	_RXF3SIDLbits
	extern	_RXF3EIDHbits
	extern	_RXF3EIDLbits
	extern	_RXF4SIDHbits
	extern	_RXF4SIDLbits
	extern	_RXF4EIDHbits
	extern	_RXF4EIDLbits
	extern	_RXF5SIDHbits
	extern	_RXF5SIDLbits
	extern	_RXF5EIDHbits
	extern	_RXF5EIDLbits
	extern	_RXM0SIDHbits
	extern	_RXM0SIDLbits
	extern	_RXM0EIDHbits
	extern	_RXM0EIDLbits
	extern	_RXM1SIDHbits
	extern	_RXM1SIDLbits
	extern	_RXM1EIDHbits
	extern	_RXM1EIDLbits
	extern	_TXB2CONbits
	extern	_TXB2SIDHbits
	extern	_TXB2SIDLbits
	extern	_TXB2EIDHbits
	extern	_TXB2EIDLbits
	extern	_TXB2DLCbits
	extern	_TXB2D0bits
	extern	_TXB2D1bits
	extern	_TXB2D2bits
	extern	_TXB2D3bits
	extern	_TXB2D4bits
	extern	_TXB2D5bits
	extern	_TXB2D6bits
	extern	_TXB2D7bits
	extern	_CANSTAT_RO3bits
	extern	_CANCON_RO3bits
	extern	_TXB1CONbits
	extern	_TXB1SIDHbits
	extern	_TXB1SIDLbits
	extern	_TXB1EIDHbits
	extern	_TXB1EIDLbits
	extern	_TXB1DLCbits
	extern	_TXB1D0bits
	extern	_TXB1D1bits
	extern	_TXB1D2bits
	extern	_TXB1D3bits
	extern	_TXB1D4bits
	extern	_TXB1D5bits
	extern	_TXB1D6bits
	extern	_TXB1D7bits
	extern	_CANSTAT_RO2bits
	extern	_CANCON_RO2bits
	extern	_TXB0CONbits
	extern	_TXB0SIDHbits
	extern	_TXB0SIDLbits
	extern	_TXB0EIDHbits
	extern	_TXB0EIDLbits
	extern	_TXB0DLCbits
	extern	_TXB0D0bits
	extern	_TXB0D1bits
	extern	_TXB0D2bits
	extern	_TXB0D3bits
	extern	_TXB0D4bits
	extern	_TXB0D5bits
	extern	_TXB0D6bits
	extern	_TXB0D7bits
	extern	_CANSTAT_RO1bits
	extern	_CANCON_RO1bits
	extern	_RXB1CONbits
	extern	_RXB1SIDHbits
	extern	_RXB1SIDLbits
	extern	_RXB1EIDHbits
	extern	_RXB1EIDLbits
	extern	_RXB1DLCbits
	extern	_RXB1D0bits
	extern	_RXB1D1bits
	extern	_RXB1D2bits
	extern	_RXB1D3bits
	extern	_RXB1D4bits
	extern	_RXB1D5bits
	extern	_RXB1D6bits
	extern	_RXB1D7bits
	extern	_CANSTAT_RO0bits
	extern	_CANCON_RO0bits
	extern	_CCP5CONbits
	extern	_CCP4CONbits
	extern	_CCP3CONbits
	extern	_CCP2CONbits
	extern	_ECCP2CONbits
	extern	_CTMUICONbits
	extern	_CTMUCONLbits
	extern	_CTMUCONHbits
	extern	_PADCFG1bits
	extern	_PMD2bits
	extern	_PMD1bits
	extern	_PMD0bits
	extern	_IOCBbits
	extern	_WPUBbits
	extern	_ANCON1bits
	extern	_ANCON0bits
	extern	_CM2CONbits
	extern	_CM2CON1bits
	extern	_CM1CONbits
	extern	_CM1CON1bits
	extern	_RXB0CONbits
	extern	_RXB0SIDHbits
	extern	_RXB0SIDLbits
	extern	_RXB0EIDHbits
	extern	_RXB0EIDLbits
	extern	_RXB0DLCbits
	extern	_RXB0D0bits
	extern	_RXB0D1bits
	extern	_RXB0D2bits
	extern	_RXB0D3bits
	extern	_RXB0D4bits
	extern	_RXB0D5bits
	extern	_RXB0D6bits
	extern	_RXB0D7bits
	extern	_CANSTATbits
	extern	_CANCONbits
	extern	_CIOCONbits
	extern	_COMSTATbits
	extern	_ECANCONbits
	extern	_PIE5bits
	extern	_PIR5bits
	extern	_IPR5bits
	extern	_EECON1bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTEbits
	extern	_T4CONbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_SLRCONbits
	extern	_ODCONbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_CCPTMRSbits
	extern	_REFOCONbits
	extern	_OSCTUNEbits
	extern	_PSTR1CONbits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_PIE3bits
	extern	_PIR3bits
	extern	_IPR3bits
	extern	_RCSTA2bits
	extern	_BAUDCON1bits
	extern	_HLVDCONbits
	extern	_T1GCONbits
	extern	_RCSTAbits
	extern	_RCSTA1bits
	extern	_TXSTAbits
	extern	_TXSTA1bits
	extern	_T3GCONbits
	extern	_T3CONbits
	extern	_CMSTATbits
	extern	_CMSTATUSbits
	extern	_CVRCONbits
	extern	_PIE4bits
	extern	_PIR4bits
	extern	_IPR4bits
	extern	_BAUDCON2bits
	extern	_TXSTA2bits
	extern	_CCP1CONbits
	extern	_ECCP1CONbits
	extern	_ECCP1DELbits
	extern	_PWM1CONbits
	extern	_ECCP1ASbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSPCON2bits
	extern	_SSPCON1bits
	extern	_SSPSTATbits
	extern	_SSPADDbits
	extern	_T2CONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_OSCCON2bits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_INTCON1bits
	extern	_STKPTRbits
	extern	_RXERRCNT
	extern	_TXERRCNT
	extern	_BRGCON1
	extern	_BRGCON2
	extern	_BRGCON3
	extern	_RXFCON0
	extern	_RXFCON1
	extern	_RXF6SIDH
	extern	_RXF6SIDL
	extern	_RXF6EIDH
	extern	_RXF6EIDL
	extern	_RXF7SIDH
	extern	_RXF7SIDL
	extern	_RXF7EIDH
	extern	_RXF7EIDL
	extern	_RXF8SIDH
	extern	_RXF8SIDL
	extern	_RXF8EIDH
	extern	_RXF8EIDL
	extern	_RXF9SIDH
	extern	_RXF9SIDL
	extern	_RXF9EIDH
	extern	_RXF9EIDL
	extern	_RXF10SIDH
	extern	_RXF10SIDL
	extern	_RXF10EIDH
	extern	_RXF10EIDL
	extern	_RXF11SIDH
	extern	_RXF11SIDL
	extern	_RXF11EIDH
	extern	_RXF11EIDL
	extern	_RXF12SIDH
	extern	_RXF12SIDL
	extern	_RXF12EIDH
	extern	_RXF12EIDL
	extern	_RXF13SIDH
	extern	_RXF13SIDL
	extern	_RXF13EIDH
	extern	_RXF13EIDL
	extern	_RXF14SIDH
	extern	_RXF14SIDL
	extern	_RXF14EIDH
	extern	_RXF14EIDL
	extern	_RXF15SIDH
	extern	_RXF15SIDL
	extern	_RXF15EIDH
	extern	_RXF15EIDL
	extern	_SDFLC
	extern	_RXFBCON0
	extern	_RXFBCON1
	extern	_RXFBCON2
	extern	_RXFBCON3
	extern	_RXFBCON4
	extern	_RXFBCON5
	extern	_RXFBCON6
	extern	_RXFBCON7
	extern	_MSEL0
	extern	_MSEL1
	extern	_MSEL2
	extern	_MSEL3
	extern	_BSEL0
	extern	_BIE0
	extern	_TXBIE
	extern	_B0CON
	extern	_B0SIDH
	extern	_B0SIDL
	extern	_B0EIDH
	extern	_B0EIDL
	extern	_B0DLC
	extern	_B0D0
	extern	_B0D1
	extern	_B0D2
	extern	_B0D3
	extern	_B0D4
	extern	_B0D5
	extern	_B0D6
	extern	_B0D7
	extern	_CANSTAT_RO9
	extern	_CANCON_RO9
	extern	_B1CON
	extern	_B1SIDH
	extern	_B1SIDL
	extern	_B1EIDH
	extern	_B1EIDL
	extern	_B1DLC
	extern	_B1D0
	extern	_B1D1
	extern	_B1D2
	extern	_B1D3
	extern	_B1D4
	extern	_B1D5
	extern	_B1D6
	extern	_B1D7
	extern	_CANSTAT_RO8
	extern	_CANCON_RO8
	extern	_B2CON
	extern	_B2SIDH
	extern	_B2SIDL
	extern	_B2EIDH
	extern	_B2EIDL
	extern	_B2DLC
	extern	_B2D0
	extern	_B2D1
	extern	_B2D2
	extern	_B2D3
	extern	_B2D4
	extern	_B2D5
	extern	_B2D6
	extern	_B2D7
	extern	_CANSTAT_RO7
	extern	_CANCON_RO7
	extern	_B3CON
	extern	_B3SIDH
	extern	_B3SIDL
	extern	_B3EIDH
	extern	_B3EIDL
	extern	_B3DLC
	extern	_B3D0
	extern	_B3D1
	extern	_B3D2
	extern	_B3D3
	extern	_B3D4
	extern	_B3D5
	extern	_B3D6
	extern	_B3D7
	extern	_CANSTAT_RO6
	extern	_CANCON_RO6
	extern	_B4CON
	extern	_B4SIDH
	extern	_B4SIDL
	extern	_B4EIDH
	extern	_B4EIDL
	extern	_B4DLC
	extern	_B4D0
	extern	_B4D1
	extern	_B4D2
	extern	_B4D3
	extern	_B4D4
	extern	_B4D5
	extern	_B4D6
	extern	_B4D7
	extern	_CANSTAT_RO5
	extern	_CANCON_RO5
	extern	_B5CON
	extern	_B5SIDH
	extern	_B5SIDL
	extern	_B5EIDH
	extern	_B5EIDL
	extern	_B5DLC
	extern	_B5D0
	extern	_B5D1
	extern	_B5D2
	extern	_B5D3
	extern	_B5D4
	extern	_B5D5
	extern	_B5D6
	extern	_B5D7
	extern	_CANSTAT_RO4
	extern	_CANCON_RO4
	extern	_RXF0SIDH
	extern	_RXF0SIDL
	extern	_RXF0EIDH
	extern	_RXF0EIDL
	extern	_RXF1SIDH
	extern	_RXF1SIDL
	extern	_RXF1EIDH
	extern	_RXF1EIDL
	extern	_RXF2SIDH
	extern	_RXF2SIDL
	extern	_RXF2EIDH
	extern	_RXF2EIDL
	extern	_RXF3SIDH
	extern	_RXF3SIDL
	extern	_RXF3EIDH
	extern	_RXF3EIDL
	extern	_RXF4SIDH
	extern	_RXF4SIDL
	extern	_RXF4EIDH
	extern	_RXF4EIDL
	extern	_RXF5SIDH
	extern	_RXF5SIDL
	extern	_RXF5EIDH
	extern	_RXF5EIDL
	extern	_RXM0SIDH
	extern	_RXM0SIDL
	extern	_RXM0EIDH
	extern	_RXM0EIDL
	extern	_RXM1SIDH
	extern	_RXM1SIDL
	extern	_RXM1EIDH
	extern	_RXM1EIDL
	extern	_TXB2CON
	extern	_TXB2SIDH
	extern	_TXB2SIDL
	extern	_TXB2EIDH
	extern	_TXB2EIDL
	extern	_TXB2DLC
	extern	_TXB2D0
	extern	_TXB2D1
	extern	_TXB2D2
	extern	_TXB2D3
	extern	_TXB2D4
	extern	_TXB2D5
	extern	_TXB2D6
	extern	_TXB2D7
	extern	_CANSTAT_RO3
	extern	_CANCON_RO3
	extern	_TXB1CON
	extern	_TXB1SIDH
	extern	_TXB1SIDL
	extern	_TXB1EIDH
	extern	_TXB1EIDL
	extern	_TXB1DLC
	extern	_TXB1D0
	extern	_TXB1D1
	extern	_TXB1D2
	extern	_TXB1D3
	extern	_TXB1D4
	extern	_TXB1D5
	extern	_TXB1D6
	extern	_TXB1D7
	extern	_CANSTAT_RO2
	extern	_CANCON_RO2
	extern	_TXB0CON
	extern	_TXB0SIDH
	extern	_TXB0SIDL
	extern	_TXB0EIDH
	extern	_TXB0EIDL
	extern	_TXB0DLC
	extern	_TXB0D0
	extern	_TXB0D1
	extern	_TXB0D2
	extern	_TXB0D3
	extern	_TXB0D4
	extern	_TXB0D5
	extern	_TXB0D6
	extern	_TXB0D7
	extern	_CANSTAT_RO1
	extern	_CANCON_RO1
	extern	_RXB1CON
	extern	_RXB1SIDH
	extern	_RXB1SIDL
	extern	_RXB1EIDH
	extern	_RXB1EIDL
	extern	_RXB1DLC
	extern	_RXB1D0
	extern	_RXB1D1
	extern	_RXB1D2
	extern	_RXB1D3
	extern	_RXB1D4
	extern	_RXB1D5
	extern	_RXB1D6
	extern	_RXB1D7
	extern	_CANSTAT_RO0
	extern	_CANCON_RO0
	extern	_CCP5CON
	extern	_CCPR5
	extern	_CCPR5L
	extern	_CCPR5H
	extern	_CCP4CON
	extern	_CCPR4
	extern	_CCPR4L
	extern	_CCPR4H
	extern	_CCP3CON
	extern	_CCPR3
	extern	_CCPR3L
	extern	_CCPR3H
	extern	_CCP2CON
	extern	_ECCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CTMUICON
	extern	_CTMUCONL
	extern	_CTMUCONH
	extern	_PADCFG1
	extern	_PMD2
	extern	_PMD1
	extern	_PMD0
	extern	_IOCB
	extern	_WPUB
	extern	_ANCON1
	extern	_ANCON0
	extern	_CM2CON
	extern	_CM2CON1
	extern	_CM1CON
	extern	_CM1CON1
	extern	_RXB0CON
	extern	_RXB0SIDH
	extern	_RXB0SIDL
	extern	_RXB0EIDH
	extern	_RXB0EIDL
	extern	_RXB0DLC
	extern	_RXB0D0
	extern	_RXB0D1
	extern	_RXB0D2
	extern	_RXB0D3
	extern	_RXB0D4
	extern	_RXB0D5
	extern	_RXB0D6
	extern	_RXB0D7
	extern	_CANSTAT
	extern	_CANCON
	extern	_CIOCON
	extern	_COMSTAT
	extern	_ECANCON
	extern	_EEDATA
	extern	_EEADR
	extern	_EEADRH
	extern	_PIE5
	extern	_PIR5
	extern	_IPR5
	extern	_TXREG2
	extern	_RCREG2
	extern	_SPBRG2
	extern	_SPBRGH2
	extern	_SPBRGH1
	extern	_EECON2
	extern	_EECON1
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTE
	extern	_TMR4
	extern	_T4CON
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_SLRCON
	extern	_ODCON
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_CCPTMRS
	extern	_REFOCON
	extern	_OSCTUNE
	extern	_PSTR1CON
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_PIE3
	extern	_PIR3
	extern	_IPR3
	extern	_RCSTA2
	extern	_BAUDCON1
	extern	_HLVDCON
	extern	_PR4
	extern	_T1GCON
	extern	_RCSTA
	extern	_RCSTA1
	extern	_TXSTA
	extern	_TXSTA1
	extern	_TXREG
	extern	_TXREG1
	extern	_RCREG
	extern	_RCREG1
	extern	_SPBRG
	extern	_SPBRG1
	extern	_T3GCON
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_CMSTAT
	extern	_CMSTATUS
	extern	_CVRCON
	extern	_PIE4
	extern	_PIR4
	extern	_IPR4
	extern	_BAUDCON2
	extern	_TXSTA2
	extern	_CCP1CON
	extern	_ECCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ECCP1DEL
	extern	_PWM1CON
	extern	_ECCP1AS
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSPCON2
	extern	_SSPCON1
	extern	_SSPSTAT
	extern	_SSPADD
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_OSCCON2
	extern	_OSCCON
	extern	_T0CON
	extern	_TMR0
	extern	_TMR0L
	extern	_TMR0H
	extern	_STATUS
	extern	_FSR2L
	extern	_FSR2H
	extern	_PLUSW2
	extern	_PREINC2
	extern	_POSTDEC2
	extern	_POSTINC2
	extern	_INDF2
	extern	_BSR
	extern	_FSR1L
	extern	_FSR1H
	extern	_PLUSW1
	extern	_PREINC1
	extern	_POSTDEC1
	extern	_POSTINC1
	extern	_INDF1
	extern	_WREG
	extern	_FSR0L
	extern	_FSR0H
	extern	_PLUSW0
	extern	_PREINC0
	extern	_POSTDEC0
	extern	_POSTINC0
	extern	_INDF0
	extern	_INTCON3
	extern	_INTCON2
	extern	_INTCON
	extern	_INTCON1
	extern	_PROD
	extern	_PRODL
	extern	_PRODH
	extern	_TABLAT
	extern	_TBLPTR
	extern	_TBLPTRL
	extern	_TBLPTRH
	extern	_TBLPTRU
	extern	_PC
	extern	_PCL
	extern	_PCLATH
	extern	_PCLATU
	extern	_STKPTR
	extern	_TOS
	extern	_TOSL
	extern	_TOSH
	extern	_TOSU

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3


	idata
_timeout	db	0x00, 0x00, 0x00, 0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1

udata_main_0	udata
_gbuffer	res	64


ustat_main_00	udata	0X0200
_stack         	res	254
_stack_end     	res	1

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block
S_main__interrupt_at_high_vector	code	0X000008
_interrupt_at_high_vector:
	goto 0x1000 + 0x0008
	
; ; Starting pCode block
S_main__interrupt_at_low_vector	code	0X000018
_interrupt_at_low_vector:
	goto 0x1000 + 0x0018
	
; I code from now on!
; ; Starting pCode block
S_main__main	code
_main:
;	.line	336; main.c	OSCCONbits.IRCF2 = 1;
	BSF	_OSCCONbits, 6
;	.line	337; main.c	OSCCONbits.IRCF1 = 1;
	BSF	_OSCCONbits, 5
;	.line	338; main.c	OSCCONbits.IRCF0 = 1;
	BSF	_OSCCONbits, 4
;	.line	341; main.c	OSCCONbits.HFIOFS = 1;
	BSF	_OSCCONbits, 2
;	.line	344; main.c	OSCTUNEbits.PLLEN = 1;
	BSF	_OSCTUNEbits, 6
;	.line	349; main.c	TRISBbits.TRISB0 = 0;
	BCF	_TRISBbits, 0
;	.line	352; main.c	UART_init();
	CALL	_UART_init
;	.line	355; main.c	for(hbeat=0; hbeat<PAGE_SIZE; hbeat++)
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00118_DS_:
;	.line	357; main.c	gbuffer[hbeat] = 0xFF;
	MOVLW	LOW(_gbuffer)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_gbuffer)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	SETF	INDF0
;	.line	355; main.c	for(hbeat=0; hbeat<PAGE_SIZE; hbeat++)
	INCF	r0x00, F
	BNC	_00141_DS_
	INCF	r0x01, F
	BNC	_00141_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00141_DS_:
	MOVLW	0x00
	SUBWF	r0x03, W
	BNZ	_00142_DS_
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00142_DS_
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00142_DS_
	MOVLW	0x40
	SUBWF	r0x00, W
_00142_DS_:
	BNC	_00118_DS_
	BANKSEL	_timeout
;	.line	361; main.c	timeout = 0x00000000;
	CLRF	_timeout, B
; removed redundant BANKSEL
	CLRF	(_timeout + 1), B
; removed redundant BANKSEL
	CLRF	(_timeout + 2), B
; removed redundant BANKSEL
	CLRF	(_timeout + 3), B
_00116_DS_:
;	.line	364; main.c	if(hbeat == 0x03F){
	MOVF	r0x00, W
	XORLW	0x3f
	BNZ	_00143_DS_
	MOVF	r0x01, W
	BNZ	_00143_DS_
	MOVF	r0x02, W
	BNZ	_00143_DS_
	MOVF	r0x03, W
	BZ	_00144_DS_
_00143_DS_:
	BRA	_00113_DS_
_00144_DS_:
;	.line	365; main.c	LED = 1;
	BSF	_LATBbits, 0
;	.line	366; main.c	hbeat++;
	INCF	r0x00, F
	BNC	_00145_DS_
	INCF	r0x01, F
	BNC	_00145_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00145_DS_:
	BRA	_00114_DS_
_00113_DS_:
;	.line	368; main.c	else if( hbeat == 0x1FF ){
	MOVF	r0x00, W
	XORLW	0xff
	BNZ	_00146_DS_
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00146_DS_
	MOVF	r0x02, W
	BNZ	_00146_DS_
	MOVF	r0x03, W
	BZ	_00147_DS_
_00146_DS_:
	BRA	_00110_DS_
_00147_DS_:
;	.line	369; main.c	LED = 0;
	BCF	_LATBbits, 0
;	.line	370; main.c	hbeat++;
	INCF	r0x00, F
	BNC	_00148_DS_
	INCF	r0x01, F
	BNC	_00148_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00148_DS_:
	BRA	_00114_DS_
_00110_DS_:
;	.line	372; main.c	else if (hbeat == 0x9FF){
	MOVF	r0x00, W
	XORLW	0xff
	BNZ	_00149_DS_
	MOVF	r0x01, W
	XORLW	0x09
	BNZ	_00149_DS_
	MOVF	r0x02, W
	BNZ	_00149_DS_
	MOVF	r0x03, W
	BZ	_00150_DS_
_00149_DS_:
	BRA	_00107_DS_
_00150_DS_:
;	.line	373; main.c	hbeat = 0x00;
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	BRA	_00114_DS_
_00107_DS_:
;	.line	376; main.c	hbeat++;
	INCF	r0x00, F
	BNC	_00114_DS_
	INCF	r0x01, F
	BNC	_00114_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00151_DS_:
_00114_DS_:
;	.line	378; main.c	bootloader_state_machine(UART_getchar(0xFF));
	CLRF	POSTDEC1
	MOVLW	0xff
	SETF	POSTDEC1
	CALL	_UART_getchar
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVWF	POSTDEC1
	CALL	_bootloader_state_machine
	MOVF	POSTINC1, F
	BRA	_00116_DS_
	RETURN	

; ; Starting pCode block
S_main__write_flash	code
_write_flash:
;	.line	590; main.c	static void write_flash(u32 address, u8 *buffer, u8 length)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	594; main.c	PIR4bits.EEIF = 0;
	BCF	_PIR4bits, 6
;	.line	596; main.c	TBLPTRL = (address) & 0xC0;
	MOVLW	0xc0
	ANDWF	r0x00, W
	MOVWF	r0x08
	CLRF	r0x09
	CLRF	r0x0a
	CLRF	r0x0b
	MOVF	r0x08, W
	MOVWF	_TBLPTRL
;	.line	597; main.c	TBLPTRH = (address >> 8) & 0xFF;
	MOVF	r0x01, W
	MOVWF	r0x08
	MOVF	r0x02, W
	MOVWF	r0x09
	MOVF	r0x03, W
	MOVWF	r0x0a
	CLRF	r0x0b
	CLRF	r0x09
	CLRF	r0x0a
	CLRF	r0x0b
	MOVF	r0x08, W
	MOVWF	_TBLPTRH
;	.line	598; main.c	TBLPTRU = (address >> 16) & 0xFF;
	MOVF	r0x02, W
	MOVWF	r0x00
	MOVF	r0x03, W
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	MOVF	r0x00, W
	MOVWF	_TBLPTRU
;	.line	604; main.c	for (counter = 0; counter < length; counter++) {
	CLRF	r0x00
	CLRF	r0x01
_00291_DS_:
	MOVFF	r0x07, r0x02
	CLRF	r0x03
	MOVF	r0x01, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x03, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00311_DS_
	MOVF	r0x02, W
	SUBWF	r0x00, W
_00311_DS_:
	BC	_00286_DS_
;	.line	605; main.c	TABLAT = buffer[counter]; /* present data to table latch */
	MOVF	r0x00, W
	ADDWF	r0x04, W
	MOVWF	r0x02
	MOVF	r0x01, W
	ADDWFC	r0x05, W
	MOVWF	r0x03
	CLRF	WREG
	BTFSC	r0x01, 7
	SETF	WREG
	ADDWFC	r0x06, W
	MOVWF	r0x08
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x08, W
	CALL	__gptrget1
	MOVWF	_TABLAT
	TBLWT*+
	
;	.line	604; main.c	for (counter = 0; counter < length; counter++) {
	INFSNZ	r0x00, F
	INCF	r0x01, F
	BRA	_00291_DS_
_00286_DS_:
	TBLRD*-
	
;	.line	631; main.c	EECON1 = 0x84; /* 0b10000100 */
	MOVLW	0x84
	MOVWF	_EECON1
;	.line	633; main.c	INTCONbits.GIE = 0;
	BCF	_INTCONbits, 7
;	.line	635; main.c	EECON2 = 0x55;
	MOVLW	0x55
	MOVWF	_EECON2
;	.line	636; main.c	EECON2 = 0xAA;
	MOVLW	0xaa
	MOVWF	_EECON2
;	.line	638; main.c	EECON1bits.WR = 1;  /* WR = 1; start write or erase operation */
	BSF	_EECON1bits, 1
;	.line	644; main.c	INTCONbits.GIE = 1;
	BSF	_INTCONbits, 7
_00287_DS_:
;	.line	646; main.c	while (!PIR4bits.EEIF);
	BTFSS	_PIR4bits, 6
	BRA	_00287_DS_
;	.line	647; main.c	PIR4bits.EEIF = 0;
	BCF	_PIR4bits, 6
;	.line	648; main.c	EECON1bits.WREN = 0;
	BCF	_EECON1bits, 2
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__erase_flash	code
_erase_flash:
;	.line	552; main.c	static void erase_flash(u32 address)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	554; main.c	PIR4bits.EEIF = 0;
	BCF	_PIR4bits, 6
;	.line	556; main.c	TBLPTRL = (address) & 0xC0;
	MOVLW	0xc0
	ANDWF	r0x00, W
	MOVWF	_TBLPTRL
;	.line	557; main.c	TBLPTRH = (address >> 8) & 0xFF;
	MOVF	r0x01, W
	MOVWF	_TBLPTRH
;	.line	558; main.c	TBLPTRU = (address >> 16) & 0xFF;
	MOVF	r0x02, W
	MOVWF	_TBLPTRU
;	.line	571; main.c	EECON1 = 0x94; /* 0b10010100 */
	MOVLW	0x94
	MOVWF	_EECON1
;	.line	573; main.c	EECON2 = 0x55;          /* unlock sequence */
	MOVLW	0x55
	MOVWF	_EECON2
;	.line	574; main.c	EECON2 = 0xAA;          /* unlock sequence */
	MOVLW	0xaa
	MOVWF	_EECON2
;	.line	575; main.c	EECON1bits.WR = 1;      /* start write or erase operation */
	BSF	_EECON1bits, 1
;	.line	577; main.c	INTCONbits.GIE = 1;
	BSF	_INTCONbits, 7
_00278_DS_:
;	.line	579; main.c	while (!PIR4bits.EEIF);
	BTFSS	_PIR4bits, 6
	BRA	_00278_DS_
;	.line	580; main.c	PIR4bits.EEIF = 0;
	BCF	_PIR4bits, 6
;	.line	581; main.c	EECON1bits.WREN = 0;
	BCF	_EECON1bits, 2
;	.line	582; main.c	EECON1bits.FREE = 0;    /* back to write operation */
	BCF	_EECON1bits, 4
;	.line	584; main.c	INTCONbits.GIE = 0;
	BCF	_INTCONbits, 7
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__jump_to_app	code
_jump_to_app:
;	.line	538; main.c	static void jump_to_app(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	541; main.c	TRISBbits.TRISB0 = 0;
	BCF	_TRISBbits, 0
;	.line	543; main.c	RCON |= 0x93; /* Set all flags as just after reset */
	MOVLW	0x93
	IORWF	_RCON, F
	goto 0x1000
	
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__bootloader_state_machine	code
_bootloader_state_machine:
;	.line	461; main.c	static void bootloader_state_machine(u8 state)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	467; main.c	switch (state)
	MOVLW	0x10
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00224_DS_
	MOVLW	0x17
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00224_DS_
	MOVLW	0xf0
	ADDWF	r0x00, F
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00259_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00259_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00259_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00259_DS_:
	GOTO	_00215_DS_
	GOTO	_00216_DS_
	GOTO	_00221_DS_
	GOTO	_00217_DS_
	GOTO	_00219_DS_
	GOTO	_00222_DS_
	GOTO	_00223_DS_
_00215_DS_:
;	.line	471; main.c	UART_putchar(GET_BOOT_VER);
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
; #	MOVWF	r0x00
; #;#	MOVF	r0x02, W
; #;#	MOVWF	r0x02
; #;#	MOVF	r0x02, W
; #;#	MOVF	r0x01, W
; #;#	MOVF	r0x01, W
; #;#	MOVWF	r0x01
; #;#	MOVF	r0x01, W
; #;#	MOVF	r0x00, W
; #	MOVF	r0x00, W
; #	MOVWF	r0x00
; #	MOVWF	r0x00
;	.line	472; main.c	send_string_uart((u8 *)BOOT_VER_STRING);
	MOVLW	UPPER(___str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_0)
	MOVWF	POSTDEC1
	CALL	_send_string_uart
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	473; main.c	break;
	BRA	_00232_DS_
_00216_DS_:
;	.line	476; main.c	UART_putchar(ACKNOWLEDGE);
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	478; main.c	break;
	BRA	_00232_DS_
_00217_DS_:
;	.line	481; main.c	for (adr = APP_ENTRY; adr < FLASH_SIZE; adr += FLASH_ERASE_BLOCK){
	CLRF	r0x00
	MOVLW	0x10
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00228_DS_:
;	.line	482; main.c	erase_flash(adr);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_erase_flash
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	481; main.c	for (adr = APP_ENTRY; adr < FLASH_SIZE; adr += FLASH_ERASE_BLOCK){
	MOVLW	0x40
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	ADDWFC	r0x03, F
	SUBWF	r0x03, W
	BNZ	_00260_DS_
	MOVLW	0x01
	SUBWF	r0x02, W
	BNZ	_00260_DS_
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00260_DS_
	MOVLW	0x00
	SUBWF	r0x00, W
_00260_DS_:
	BNC	_00228_DS_
;	.line	484; main.c	UART_putchar(ACKNOWLEDGE);
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	485; main.c	break;
	BRA	_00232_DS_
_00219_DS_:
;	.line	488; main.c	address = (((u32)UART_getchar(0x7FFF))<<24);
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVLW	0xff
	SETF	POSTDEC1
	CALL	_UART_getchar
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVWF	r0x07
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
;	.line	489; main.c	address |= (((u32)UART_getchar(0x7FFF))<<16);
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVLW	0xff
	SETF	POSTDEC1
	CALL	_UART_getchar
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	CLRF	r0x0b
	MOVWF	r0x0a
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x04, F
	IORWF	r0x05, F
	MOVF	r0x0a, W
	IORWF	r0x06, F
	MOVF	r0x0b, W
	IORWF	r0x07, F
;	.line	490; main.c	address |= (((u32)UART_getchar(0x7FFF))<<8);
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVLW	0xff
	SETF	POSTDEC1
	CALL	_UART_getchar
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	CLRF	r0x0a
	MOVWF	r0x09
	CLRF	r0x08
	MOVF	r0x08, W
	IORWF	r0x04, F
	MOVF	r0x09, W
	IORWF	r0x05, F
	MOVF	r0x0a, W
	IORWF	r0x06, F
	IORWF	r0x07, F
;	.line	491; main.c	address |= ((u32)UART_getchar(0x7FFF));
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVLW	0xff
	SETF	POSTDEC1
	CALL	_UART_getchar
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	IORWF	r0x04, F
	MOVF	r0x01, W
	IORWF	r0x05, F
	IORWF	r0x06, F
	IORWF	r0x07, F
;	.line	492; main.c	for (adr = 0; adr < PAGE_SIZE; adr++){
	CLRF	r0x00
_00230_DS_:
;	.line	493; main.c	gbuffer[adr] = UART_getchar(0x7FFF);
	MOVLW	LOW(_gbuffer)
	ADDWF	r0x00, W
	MOVWF	r0x08
	MOVLW	HIGH(_gbuffer)
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x7f
	MOVWF	POSTDEC1
	MOVLW	0xff
	SETF	POSTDEC1
	CALL	_UART_getchar
	MOVWF	r0x0a
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	r0x0a, INDF0
;	.line	492; main.c	for (adr = 0; adr < PAGE_SIZE; adr++){
	INCF	r0x00, F
	BNC	_00264_DS_
	INCF	r0x01, F
	BNC	_00264_DS_
	INFSNZ	r0x02, F
	INCF	r0x03, F
_00264_DS_:
	MOVLW	0x00
	SUBWF	r0x03, W
	BNZ	_00265_DS_
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00265_DS_
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00265_DS_
	MOVLW	0x40
	SUBWF	r0x00, W
_00265_DS_:
	BNC	_00230_DS_
;	.line	495; main.c	erase_flash(address);
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_erase_flash
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	496; main.c	write_flash(address, gbuffer, PAGE_SIZE);
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_gbuffer)
	MOVWF	POSTDEC1
	MOVLW	LOW(_gbuffer)
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_write_flash
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	497; main.c	UART_putchar(ACKNOWLEDGE);
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	498; main.c	break;
	BRA	_00232_DS_
_00221_DS_:
;	.line	502; main.c	UART_putchar(PAGE_SIZE_REQUEST);
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	504; main.c	UART_putchar((u8)((PAGE_SIZE_VALUE&0xFF00)>>8));
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	506; main.c	UART_putchar((u8)(PAGE_SIZE_VALUE&0x00FF));
	MOVLW	0x40
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	507; main.c	UART_putchar(crc);
	MOVLW	0x52
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	508; main.c	break;
	BRA	_00232_DS_
_00222_DS_:
;	.line	512; main.c	UART_putchar(ADDRESS_ALIGMENT);
	MOVLW	0x15
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	514; main.c	UART_putchar((u8)((ADDRESS_ALIGMENT_VALUE&0xFF00)>>8));
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	516; main.c	UART_putchar((u8)(ADDRESS_ALIGMENT_VALUE&0x00FF));
	MOVLW	0x3f
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	517; main.c	UART_putchar(crc);
	MOVLW	0x54
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	518; main.c	break;
	BRA	_00232_DS_
_00223_DS_:
;	.line	521; main.c	UART_putchar(ACKNOWLEDGE);
	MOVLW	0x12
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
;	.line	522; main.c	jump_to_app(); /* Jump to user application code */
	CALL	_jump_to_app
;	.line	523; main.c	break;
	BRA	_00232_DS_
_00224_DS_:
	BANKSEL	_timeout
;	.line	526; main.c	timeout++;
	INCF	_timeout, F, B
	BNC	_00266_DS_
; removed redundant BANKSEL
	INCF	(_timeout + 1), F, B
	BNC	_00266_DS_
; removed redundant BANKSEL
	INCFSZ	(_timeout + 2), F, B
	BRA	_10321_DS_
; removed redundant BANKSEL
	INCF	(_timeout + 3), F, B
_10321_DS_:
_00266_DS_:
	BANKSEL	_timeout
;	.line	527; main.c	if(timeout == TIMEOUT){
	MOVF	_timeout, W, B
	XORLW	0xff
	BNZ	_00267_DS_
; removed redundant BANKSEL
	MOVF	(_timeout + 1), W, B
	XORLW	0x1f
	BNZ	_00267_DS_
; removed redundant BANKSEL
	MOVF	(_timeout + 2), W, B
	BNZ	_00267_DS_
; removed redundant BANKSEL
	MOVF	(_timeout + 3), W, B
	BZ	_00268_DS_
_00267_DS_:
	BRA	_00232_DS_
_00268_DS_:
;	.line	528; main.c	jump_to_app(); /* Jump to user application code */
	CALL	_jump_to_app
_00232_DS_:
;	.line	532; main.c	}
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__send_string_uart	code
_send_string_uart:
;	.line	447; main.c	static void send_string_uart(u8 *buf)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	451; main.c	do{
	CLRF	r0x03
_00207_DS_:
;	.line	452; main.c	if(buf[i] != '\0'){
	MOVF	r0x03, W
	ADDWF	r0x00, W
	MOVWF	r0x04
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	CALL	__gptrget1
	MOVWF	r0x04
	MOVF	r0x04, W
	BZ	_00208_DS_
;	.line	453; main.c	UART_putchar(buf[i]);
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_UART_putchar
	MOVF	POSTINC1, F
_00208_DS_:
;	.line	455; main.c	}while(buf[i++] != '\0');
	MOVFF	r0x03, r0x04
	INCF	r0x03, F
	CLRF	r0x05
	CLRF	r0x06
	MOVF	r0x00, W
	ADDWF	r0x04, F
	MOVF	r0x01, W
	ADDWFC	r0x05, F
	MOVF	r0x02, W
	ADDWFC	r0x06, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x04
	MOVF	r0x04, W
	BNZ	_00207_DS_
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__UART_getchar	code
_UART_getchar:
;	.line	424; main.c	static u8 UART_getchar(u16 tout_val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	428; main.c	while(!PIR1bits.RCIF){
	CLRF	r0x02
	CLRF	r0x03
_00175_DS_:
	BTFSC	_PIR1bits, 5
	BRA	_00177_DS_
;	.line	429; main.c	if(tout == tout_val){
	MOVF	r0x02, W
	XORWF	r0x00, W
	BNZ	_00195_DS_
	MOVF	r0x03, W
	XORWF	r0x01, W
	BZ	_00196_DS_
_00195_DS_:
	BRA	_00173_DS_
_00196_DS_:
;	.line	430; main.c	return(0);
	CLRF	WREG
	BRA	_00181_DS_
_00173_DS_:
;	.line	433; main.c	tout++;
	INFSNZ	r0x02, F
	INCF	r0x03, F
	BRA	_00175_DS_
_00177_DS_:
	BANKSEL	_timeout
;	.line	436; main.c	timeout = 0x00000000;
	CLRF	_timeout, B
; removed redundant BANKSEL
	CLRF	(_timeout + 1), B
; removed redundant BANKSEL
	CLRF	(_timeout + 2), B
; removed redundant BANKSEL
	CLRF	(_timeout + 3), B
;	.line	437; main.c	if( (RCSTAbits.FERR == 1) || (RCSTAbits.OERR == 1) ){
	CLRF	r0x00
	BTFSC	_RCSTAbits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00178_DS_
	CLRF	r0x00
	BTFSC	_RCSTAbits, 1
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00179_DS_
_00178_DS_:
;	.line	438; main.c	RCSTAbits.CREN = 0; /* Clear an error */
	BCF	_RCSTAbits, 4
;	.line	439; main.c	RCSTAbits.CREN = 1; /* Start continous receiving again */
	BSF	_RCSTAbits, 4
_00179_DS_:
;	.line	441; main.c	return((u8)RCREG1);
	MOVF	_RCREG1, W
_00181_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__UART_putchar	code
_UART_putchar:
;	.line	412; main.c	static void UART_putchar(u8 outchar)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
_00161_DS_:
;	.line	414; main.c	while(!TXSTA1bits.TRMT);
	BTFSS	_TXSTA1bits, 1
	BRA	_00161_DS_
;	.line	416; main.c	TXREG1 = outchar;
	MOVFF	r0x00, _TXREG1
_00164_DS_:
;	.line	418; main.c	while(!TXSTA1bits.TRMT);
	BTFSS	_TXSTA1bits, 1
	BRA	_00164_DS_
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__UART_init	code
_UART_init:
;	.line	387; main.c	TRISCbits.TRISC6 = 0; /* TX pin set as output */
	BCF	_TRISCbits, 6
;	.line	388; main.c	TRISCbits.TRISC7 = 1; /* RX pin set as input */
	BSF	_TRISCbits, 7
;	.line	394; main.c	TXSTAbits.SYNC = 0;
	BCF	_TXSTAbits, 4
;	.line	395; main.c	TXSTAbits.BRGH = 0;
	BCF	_TXSTAbits, 2
;	.line	396; main.c	BAUDCON1bits.BRG16 = 0;
	BCF	_BAUDCON1bits, 3
;	.line	397; main.c	SPBRG = 103;
	MOVLW	0x67
	MOVWF	_SPBRG
;	.line	400; main.c	TXSTAbits.TXEN = 1;
	BSF	_TXSTAbits, 5
;	.line	403; main.c	RCSTAbits.SPEN = 1;
	BSF	_RCSTAbits, 7
;	.line	406; main.c	RCSTAbits.CREN = 1;
	BSF	_RCSTAbits, 4
	RETURN	

; ; Starting pCode block
___str_0:
	DB	0x42, 0x6f, 0x6f, 0x74, 0x5f, 0x31, 0x2e, 0x30, 0x2e, 0x61, 0x00


; Statistics:
; code size:	 1828 (0x0724) bytes ( 1.39%)
;           	  914 (0x0392) words
; udata size:	  319 (0x013f) bytes ( 9.40%)
; access size:	   12 (0x000c) bytes


	end
