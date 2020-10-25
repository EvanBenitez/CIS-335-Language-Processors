.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
	ADD eax, 7
	ADD edx, 7

	INVOKE ExitProcess,0
main ENDP
END main