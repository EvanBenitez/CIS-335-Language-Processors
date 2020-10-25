INCLUDE Irvine32.inc

.data

.code
main PROC
	CALL Clrscr
	CALL Randomize

	MOV ecx, 10
	MOV eax, 0
L1:
	;Get random number from 50 to 100 and print to screen
	MOV al, 51
	CALL RandomRange
	ADD al, 50
	CALL WriteDec

	;print space
	PUSH eax
	MOV eax, ' '
	CALL WriteChar
	POP eax

	;Calculate grade and print to screen
	CALL CalcGrade
	CALL WriteChar
	CALL Crlf
	LOOP L1

	INVOKE ExitProcess,0
main ENDP

;CalcGrade
;Calculates the letter grade from a score out of 100
;Recieves: AL = Score
;Returns: AL = Letter Grade
CalcGrade PROC
	PUSH bx
	MOV bl, 90
	CMP al,bl
	JNAE L1
	MOV al, 'A'
	JMP L5
L1:
	MOV bl, 80
	CMP al,bl
	JNAE L2
	MOV al, 'B'
	JMP L5
L2:
	MOV bl, 70
	CMP al,bl
	JNAE L3
	MOV al, 'C'
	JMP L5
L3:
	MOV bl, 60
	CMP al,bl
	JNAE L4
	MOV al, 'D'
	JMP L5
L4:
	MOV al, 'F'
L5:
	POP bx
	ret
CalcGrade ENDP
END main