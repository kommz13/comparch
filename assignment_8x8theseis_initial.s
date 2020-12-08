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
			daddi R12, R12, 0				;set the sum of positives=0
			daddi R13, R13, 0				;set the sum of negatives=0
			daddi R14, R14, 0				;set the sum of zeros=0			
			daddi R9,$zero,8	; R9=2 (telos mege8ous grammns/broxou)
			daddi R5, $zero,512
			daddi R6, $zero,1024
			daddi R16,$zero,0		; i=0 arxikes times prwtou broxou for
L1:			daddi R17,$zero,0		; j=0 arxikes times prwtou broxou for
L2:			daddi R18,$zero,0		; k=0 arxikes times prwtou broxou for

			dsll R10, R16, 3
			;dmult R16, R9			; R10 =i*8 mege8os grammns tou x
			;mflo R10
			daddu R10, R10, r17		; R10 =i* mege8os(grammns)+j
			
			dsll R10, R10, 3		; R10 = sxetikn apostasn byte tou [i][j]
				
			daddu R10, R4, R10  ; R10 = dieu8uvsn byte tou x[i][j]
			ld R19, 0(R10)	; R19 = 8 byte tou x[i][j]
			
L3:			dsll R8, R18, 3
			;dmult R18, R9		 ; R8 = k*8 (mege8os grammns tou z) 
			;mflo R8
			daddu R8, R8, R17	; R8 = k * mege8os(grammns)+j
			dsll R8, R8, 3   ; R8 = sxetikn apostasn byte tou [k][j]
			daddu R8, R6, R8  ; R8 = dieu8uvsn byte tou z[k][j]
			ld R20, 0(R8)	; R20 = 8 byte tou z[k][j]
			
			dsll R11, R16, 3
			;dmult R16, R9		 ; R11 = i*8 (mege8os grammns tou y) 
			;mflo R11
			daddu R11, R11, R18	; R11 = i * mege8os(grammns)+k
			dsll R11, R11, 3     ; R11 = sxetikn dieu8uvsn byte tou [i][k]
			daddu R11, R5, R11  ; R11 = dieu8uvsn byte tou y[i][k]
			ld R21, 0(R11)	; R21 = 8 byte tou y[i][k]
			
			dmult R20, R21 ; y[i][k]*z[k][j]
			mflo R20 ; R20 = y[i][k]*z[k][j]
			dadd R19, R19, R20 ; R19 = x[i][j] + y[i][k]*z[k][j]
			
			
			daddui R18, R18, 1	; $k k + 1
			bne R18, R9, L3    ; Av (k != 8) metabasnstnv L3
			
			
stats:		beqz R19, zeros
			bgez R19, positives
			daddi R13, R13, 1		;increment sum of negatives
			j next_iter
			
zeros:		daddi R14, R14, 1		;increment sum of zeros
			j next_iter
			
positives:	daddi r12, r12, 1		;increment sum of positives
			
			
next_iter:	sd R19, 0(R10)     ; x[i][j] = R19
			
			daddui R17, R17, 1   ; j = j + 1
			bne R17, R9, L2	; av (j != 8) metabasnstnv L2
			daddui R16, R16, 1   ; i = i + 1
			bne R16, R9, L1	; av (i != 8) metabasnstnv L1			
			
			
exit:		daddi R5, R0, format_str
			sw R5, fs_addr(R0)
			sd R12, pos_addr(R0)	;update memory with stats
			sd R13, neg_addr(R0)
			sd R14, zer_addr(R0)
			
			daddi R14, R0, fs_addr
			syscall 5

			syscall 0
		
		