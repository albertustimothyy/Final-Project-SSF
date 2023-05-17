; Assembly Code
;---------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global main
.global SPI_MAX7219_init
.global MAX7219_disp_digits
;------------------------
main:
SBI DDRB, 2   ;set port B2 as output
CBI DDRD, 2   ;set port D2 as input
agn:
SBIC PIND, 2  ;skip next statement if red button not pressed
RJMP MAX7219_disp_digits
RJMP agn      ;repeat indefinitely
;----------------------------------------------------------------

;==============================================================
SPI_MAX7219_init:
;------------
.equ  SCK, 5
.equ  MOSI, 3
.equ  SS, 2
;--------------------------------------------------------------
    LDI   R17, (1<<MOSI)|(1<<SCK)|(1<<SS)
    OUT   DDRB, R17       ;set MOSI, SCK, SS as o/p
    ;--------------------------------------------------------
    LDI   R17, (1<<SPE)|(1<<MSTR)|(1<<SPR0)
    OUT   SPCR, R17       ;enable SPI as master, fsck=fosc/16
    ;--------------------------------------------------------
    LDI   R17, 0x0A       ;segment intensity (0 to 15)
    LDI   R18, 0          ;intensity level = 2    
    RCALL send_bytes      ;send command & data to MAX7219
    ;--------------------------------------------------------
    LDI   R17, 0x09       ;decoding mode command
    LDI   R18, 0x00       ;decoding off
    RCALL send_bytes      ;send command & data to MAX7219
    ;--------------------------------------------------------
    LDI   R17, 0x0B       ;scan limit command
    LDI   R18, 0x07       ;8 digits connected to MAX7219
    RCALL send_bytes      ;send command & data to MAX7219
    ;--------------------------------------------------------
    LDI   R17, 0x0C       ;turn ON/OFF command
    LDI   R18, 0x01       ;turn ON MAX7219
    RCALL send_bytes      ;send command & data to MAX7219
    ;--------------------------------------------------------
    RET
;==============================================================
MAX7219_disp_digits:
;--------------------
    RCALL disp_digit0
    RCALL my_delay
    RCALL disp_digit1
    RCALL my_delay
    ;------------------------
    RJMP  MAX7219_disp_digits
;==============================================================
send_bytes:
;----------
    CBI   PORTB, SS       ;enable slave device MAX7219
    ;--------------------------------------------------------
    OUT   SPDR, R17       ;transmit command
    ;--------------------------------------------------------
l1: IN    R19, SPSR
    SBRS  R19, SPIF       ;wait for byte transmission
    RJMP  l1              ;to complete
    ;--------------------------------------------------------
    OUT   SPDR, R18       ;transmit data
    ;--------------------------------------------------------
l2: IN    R19, SPSR
    SBRS  R19, SPIF       ;wait for byte transmission
    RJMP  l2              ;to complete
    ;--------------------------------------------------------
    SBI   PORTB, SS       ;disable slave device MAX7219
    RET
;==============================================================
my_delay:
;--------
    LDI   R21, 255
l3: LDI   R22, 255
l4: LDI   R23, 100
l5: DEC   R23
    BRNE  l5
    DEC   R22
    BRNE  l4
    DEC   R21
    BRNE  l3
    RET
;==============================================================
disp_digit0:
;-----------
    LDI   R17, 0x01
    LDI   ZL, lo8(digit0)
    LDI   ZH, hi8(digit0)
    LDI   R19, 8
l6: LPM   R18, Z+
    RCALL send_bytes
    INC   R17
    CPI   R17, 9
    BRPL  ex1
    DEC   R19
    BRNE  l6
ex1:RET
;-------------------------------------------------------------
digit0:
.byte 0b00111100,0b01000010,0b10100101,0b10000001
.byte 0b10100101,0b10011001,0b01000010,0b00111100
;==============================================================
disp_digit1:
;-----------
    LDI   R17, 0x01
    LDI   ZL, lo8(digit1)
    LDI   ZH, hi8(digit1)
    LDI   R19, 8
l7: LPM   R18, Z+
    RCALL send_bytes
    INC   R17
    CPI   R17, 9
    BRPL  ex2
    DEC   R19
    BRNE  l7
ex2:RET
;-------------------------------------------------------------
digit1:
.byte 0b00111100,0b01000010,0b10000101,0b10000001
.byte 0b10100101,0b10011001,0b01000010,0b00111100
;==============================================================