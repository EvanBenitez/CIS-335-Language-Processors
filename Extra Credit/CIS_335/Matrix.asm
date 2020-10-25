.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
Row1Out DWORD ?
Row2Out DWORD ?

.code
main PROC
	MOV eax, 5
	IMUL eax, 4
	MOV ebx, 3
	IMUL ebx, 2
	ADD eax, ebx
	MOV Row1Out, eax

	MOV eax, 5
	IMUL eax, 5
	MOV ebx, 3
	IMUL ebx, 3
	ADD eax, ebx
	MOV Row2Out, eax

	INVOKE ExitProcess,0
main ENDP
END main