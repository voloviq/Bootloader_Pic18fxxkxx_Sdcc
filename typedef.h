/*
  Author: Michal Wolowik
  Corporation: VOLOVIQUE
  Date: Warsaw 23-VII-2015
  Destination: 
    Conecern to Pic18fxxkxx devices for XC8 compiler

  File name:
    typedef.h

  File destination:
    This file give simple type definition

  Dependecies:
    No hardware dependecies

  Compiler:
    XC8 - version: v1.34 - in free mode

  GUI:
    MPLAB X IDE v3.06

  Documentation:
    XC8 compiler documentation

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
    This module don't to be tested.
 */




#ifndef TYPEDEF_H
#define	TYPEDEF_H

#ifdef	__cplusplus
extern "C" {
#endif
    
    #define TRUE 1
    #define FALSE 0

    #define HIGHB(x)  ((x) >> 8)
    #define LOWB(x)   ((x) & 0xFF)

    typedef signed char s8;
    typedef signed int s16;
    typedef signed long s32;

    typedef unsigned char u8;
    typedef unsigned int u16;
    typedef unsigned long u32;

#ifdef	__cplusplus
}
#endif

#endif	/* TYPEDEF_H */