INCLUDE Irvine32.inc

.data
input BYTE 50 DUP(?)
Prompt BYTE "Input: ",0
Invalid BYTE "Invalid Input",0
Valid BYTE "Valid Input",0
Compare BYTE "MASM",0

.code
main PROC
	;Clear screan an write prompt to screen
	CALL Clrscr
	MOV edx, OFFSET Prompt
	CALL WriteString
	
	;Get user input
	MOV edx, OFFSET input
	MOV ecx, SIZEOF input
	CALL ReadString

	;check input
	MOV esi, 0
	MOV ecx, LENGTHOF Compare
L1:
	MOVZX eax, input[esi]
	CMP al, Compare[esi]
	JNE L2
	INC esi
	LOOP L1

	;Offset for valid input
	MOV edx, OFFSET Valid
	JMP L3

	;input for invalid input
L2:
	MOV edx, OFFSET Invalid

	;write result to screen
L3:
	CALL WriteString
	INVOKE ExitProcess,0
main ENDP
END main