; Assembly Code
;---------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global main
;------------------------
main:
  SBI DDRB, 2 ;set port B2 as output
  SBI DDRD, 2 ;set port D2 as output for motion sensor
agn:
  SBIS PIND, 2 ;skip next statement if motion sensor not triggered
  RJMP redledON
  RCALL myDelay
  RJMP agn ;repeat indefinitely
;----------------------------------------------------------------
redledON:
  LDI R21, 10 ;initial value of counter R21
redagain:
  SBI PORTB, 2 ;turn ON blue LED
  RCALL myDelay ;call subroutine myDelay
  CBI PORTB, 2 ;turn OFF blue LED
  RCALL myDelay ;call subroutine myDelay
  SUBI R21, 1 ;decrement counter by 1
  BRNE redagain ;loop if counter not zero
  RJMP agn
;================================================================
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