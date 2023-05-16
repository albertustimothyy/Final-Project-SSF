; Assembly Code
;---------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global main
;------------------------
main:
SBI DDRB, 2   ;set port B2 as output
CBI DDRD, 2   ;set port D2 as input
agn:
SBIC PIND, 2  ;skip next statement if PIR Sensor Low
RJMP redledON
RJMP agn      ;repeat indefinitely
;----------------------------------------------------------------
redledON: ;LED for testing only
SBIC PORTB, 2
RJMP led
SBI PORTB, 2  ;turn ON red LED
led:
CBI PORTB, 2
RJMP agn

myDelay: ;3-level nested loop subroutine
LDI R20, 255 ;outer loop counter
l1: LDI R21, 255 ;mid loop counter
l2: LDI R22, 41 ;inner loop counter to give 0.5s delay
l3: DEC R22 ;decrement inner loop
BRNE l3 ;loop if not zero
DEC R21 ;decrement mid loop
BRNE l2 ;loop if not zero
DEC R20 ;decrement outer loop
BRNE l1 ;loop if not zero
RET ;return to caller