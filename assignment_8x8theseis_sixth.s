		.data
		
ArrayX:	.word -12, -8, 3, 6, 17, 9, -4, 10
		.word -12, -8, 3, 6, 17, 9, -4, 10
		.word -12, -8, 3, 6, 17, 9, -4, 10
		.word -12, -8, 3, 6, 17, 9, -4, 10
		.word -12, -8, 3, 6, 17, 9, -4, 10
		.word -12, -8, 3, 6, 17, 9, -4, 10
		.word -12, -8, 3, 6, 17, 9, -4, 10
		.word -12, -8, 3, 6, 17, 9, -4, 10
		
ArrayY:	.word -11, -9, 4, 5, 18, 2, -3, 11
		.word -11, -9, 4, 5, 18, 2, -3, 11
		.word -11, -9, 4, 5, 18, 2, -3, 11
		.word -11, -9, 4, 5, 18, 2, -3, 11
		.word -11, -9, 4, 5, 18, 2, -3, 11
		.word -11, -9, 4, 5, 18, 2, -3, 11
		.word -11, -9, 4, 5, 18, 2, -3, 11
		.word -11, -9, 4, 5, 18, 2, -3, 11
		
ArrayZ: .word -1, 0, 1, 8, 19, 3, 5, -11
		.word -1, 0, 1, 8, 19, 3, 5, -11
		.word -1, 0, 1, 8, 19, 3, 5, -11
		.word -1, 0, 1, 8, 19, 3, 5, -11
		.word -1, 0, 1, 8, 19, 3, 5, -11
		.word -1, 0, 1, 8, 19, 3, 5, -11
		.word -1, 0, 1, 8, 19, 3, 5, -11
		.word -1, 0, 1, 8, 19, 3, 5, -11
		
format_str:	.asciiz	"Sum of positives: %i \n Sum of negatives: %i \n Sum of zeros: %i"
s_positive:	.word 0
s_negative:	.word 0
s_zero:		.word 0
fs_addr:	.space 4

pos_addr:	.space 4	
neg_addr:	.space 4
zer_addr:	.space 4
		
		

		.text

main:
			daddi R12, R0, 0				;set the sum of positives=0
			daddi R14, R0, 0				;set the sum of zeros=0			
			daddi R9,$zero,8	; R9=2 (telos mege8ous grammns/broxou)
			daddi R2,$zero,64	;R2= total numbers
			daddi R5, $zero,512
			daddi R6, $zero,1024
			daddi R16,$zero,0		; i=0 arxikes times prwtou broxou for
L1:			daddi R17,$zero,0		; j=0 arxikes times prwtou broxou for
L2:			daddi R18,$zero,0		; k=0 arxikes times prwtou broxou for

			;dsll R10, R16, 3
			;dmult R16, R9			; R10 =i*8 mege8os grammns tou x
			;mflo R10
			dadd R10, R15, R0
			daddu R10, R10, r17		; R10 =i* mege8os(grammns)+j
			
			
			dsll R10, R10, 3		; R10 = sxetikn apostasn byte tou [i][j]
				
			daddu R10, R4, R10  ; R10 = dieu8uvsn byte tou x[i][j]
			ld R19, 0(R10)	; R19 = 8 byte tou x[i][j]
						
L3:			;dsll R8, R18, 3
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
					;second loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;third loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;fourth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;fifth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;sixth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;seventh loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;eightth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			
			bne R18, R9, L3    ; Av (k != 8) metabasn stnv L3
			daddui R17, R17, 1   ; j = j + 1
			
stats:		beqz R19, zeros
			bgez R19, positives
			j next_iter
			
zeros:		daddi R14, R14, 1		;increment sum of zeros
			j next_iter
			
positives:	daddi r12, r12, 1		;increment sum of positives
			
next_iter:	sd R19, 0(R10)     ; x[i][j] = R19

secondL2:	daddi R18,$zero,0		; k=0 arxikes times prwtou broxou for

			;dsll R10, R16, 3
			;dmult R16, R9			; R10 =i*8 mege8os grammns tou x
			;mflo R10
			dadd R10, R15, R0
			daddu R10, R10, r17		; R10 =i* mege8os(grammns)+j
			
			
			dsll R10, R10, 3		; R10 = sxetikn apostasn byte tou [i][j]
				
			daddu R10, R4, R10  ; R10 = dieu8uvsn byte tou x[i][j]
			ld R19, 0(R10)	; R19 = 8 byte tou x[i][j]
						
L3_1:		;dsll R8, R18, 3
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
					;second loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;third loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;fourth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;fifth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;sixth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;seventh loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			;eightth loop
			dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			;dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			dadd R11, R15, R0
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			daddui R18, R18, 1	; $k k + 1
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			
			bne R18, R9, L3    ; Av (k != 8) metabasn stnv L3
			daddui R17, R17, 1   ; j = j + 1
			
stats1:		beqz R19, zeros1
			bgez R19, positives1
			j next_iter1
			
zeros1:		daddi R14, R14, 1		;increment sum of zeros
			j next_iter1
			
positives1:	daddi r12, r12, 1		;increment sum of positives
			
next_iter1:	sd R19, 0(R10)     ; x[i][j] = R19

			bne R17, R9, L2	; av (j != 8) metabasn stnv L2
			daddui R16, R16, 1   ; i = i + 1
			daddui R15, R15, 8
			bne R16, R9, L1	; av (i != 8) metabasn stnv L1			
			
			
exit:		dsub R13, R2, R12		;remaining are the negatives
			dsub R13, R13, R14
			daddi R5, R0, format_str
			sw R5, fs_addr(R0)
			sd R12, pos_addr(R0)	;update memory with stats
			sd R13, neg_addr(R0)
			sd R14, zer_addr(R0)
			
			daddi R14, R0, fs_addr
			syscall 5

			syscall 0
		
