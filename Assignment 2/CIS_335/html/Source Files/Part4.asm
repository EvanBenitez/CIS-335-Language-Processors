.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
First BYTE 45

.data
Second BYTE 35

.code
main PROC

.data
Forth BYTE 15

.code
	INVOKE ExitProcess,0
main ENDP
END main

.data
Third BYTE 25

.code
	MOV eax, 4
