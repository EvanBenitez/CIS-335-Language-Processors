INCLUDE Irvine32.inc

.data
key SBYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6 
test1 BYTE "Here is some data to test this code.", 0
test2 BYTE "Yet another string so that we can further test this code, just in CASE",0

.code
main PROC
	CALL Clrscr					;Clear screen and print original text
	MOV edx, OFFSET test1
	CALL WriteString
	CALL Crlf

	MOV esi, OFFSET test1		;Print Encrypted text
	MOV eax, OFFSET key
	CALL Encrypt
	CALL WriteString

	CALL Crlf
	CALL Crlf

	MOV edx, OFFSET test2		;Repeat for second string
	CALL WriteString
	CALL Crlf

	MOV esi, OFFSET test2		
	MOV eax, OFFSET key
	CALL Encrypt
	CALL WriteString


	INVOKE ExitProcess,0
main ENDP

;Encrypt
;Encrypts a string
;Recieves: EAX = Pointer to key, ESI = Pointer to string
Encrypt PROC
	PUSHAD
	MOV edx, 0
	MOV ecx, 0
L1:
	MOV cl, SBYTE PTR [eax]		;shift BYTE
	CMP cl, 0
	JL L3
	ROR BYTE PTR [esi], cl	
	JMP L4
L3:
	NEG cl						;convert to positive number
	ROL BYTE PTR [esi], cl
L4:
	INC esi
	INC eax
	
	MOVZX ebx, BYTE PTR [esi]	;check for end of string
	CMP ebx, 0
	JE L2						;Break out at end of string

	INC edx						;check for end of key
	CMP edx, 10
	JNE L1

	SUB eax, 10					;reset to front of key
	MOV edx, 0
	

JMP L1

L2:
	POPAD
	ret
Encrypt ENDP
END main