INCLUDE Irvine32.inc

.data
enc BYTE "8>&&.9KY[Y[K(“8KXX^",0
decry BYTE LENGTHOF enc dup(?)

.code
main PROC
	Mov ecx, 255
	Mov esi, OFFSET enc
	Mov edi, OFFSET decry
	Mov edx, OFFSET decry
	Mov eax, 0

L1:
	LODSB
	XOR al, cl
	STOSB
	Mov al, BYTE PTR [esi]
	Cmp al,0
	JNE L1

	Call WriteString
	Mov al, " "
	Call WriteChar
	Mov al, cl
	Call WriteDec
	Call Crlf

	Mov esi, OFFSET enc
	Mov edi, OFFSET decry
LOOP L1

LF:
	INVOKE ExitProcess,0
main ENDP
END main