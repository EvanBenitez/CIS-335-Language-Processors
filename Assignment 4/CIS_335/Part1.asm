INCLUDE Irvine32.inc

.data
string BYTE 21 DUP(?)

.code
main PROC
	MOV eax, LENGTHOF string - 1	;length for RanString 
	MOV esi, OFFSET string			;Offset for RanString 
	MOV edx, OFFSET string			;Offset for WriteString
	MOV ecx, 20
	CALL Clrscr
L1:
	CALL RanString
	CALL WriteString
	CALL Crlf
LOOP L1

	INVOKE ExitProcess,0
main ENDP

;RanString
;Generates a random string of uppercase letters
;Recieves: EAX = Number of random letters, ESI = Pointer to array of bytes
RanString PROC
	PUSHAD
	MOV ecx, eax
	CALL Randomize
L1:
	MOV eax, 26
	CALL RandomRange
	ADD eax, 65
	MOV [esi], eax
	INC esi
LOOP L1
	MOV [esi], BYTE PTR 0
	POPAD
	ret
RanString ENDP

END main