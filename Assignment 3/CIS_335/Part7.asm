INCLUDE Irvine32.inc

.data
num DWORD 1, 5, 8, 18, 35, 36, 82
sum DWORD 0
txt BYTE "Sum = "

.code
main PROC
	CALL Clrscr
	MOV ebx, OFFSET num				;pointer to start of array
	MOV ecx, LENGTHOF num - 1		;get number of elements minus one 
L1:
	MOV eax, [ebx + TYPE num]
	SUB eax, [ebx]
	CALL WriteDec
	ADD sum, eax
	ADD ebx, TYPE num
	MOV al, ','
	CALL WriteChar
	MOV al, ' '
	CALL WriteChar
LOOP L1

	CALL Crlf
	MOV edx, OFFSET txt
	CALL WriteString
	MOV eax, sum
	CALL WriteDec
	INVOKE ExitProcess,0
main ENDP

END main