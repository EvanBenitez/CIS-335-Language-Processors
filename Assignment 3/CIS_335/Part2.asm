.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
fib BYTE 7 dup(?)	;store the first 7 Fibonacci sequence numbers

.code
main PROC
	MOV fib,1
	MOV [fib+1],1
	MOV ecx, 5
	MOV esi, OFFSET [fib+1]
L1:
	MOV al, [esi]
	ADD al, [esi-1] 
	INC esi
	MOV [esi],al
	LOOP L1

	INVOKE ExitProcess,0
main ENDP
END main