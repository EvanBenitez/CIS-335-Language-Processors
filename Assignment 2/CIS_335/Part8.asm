.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
num1 EQU <"123">
num2 EQU <"321">
func EQU <"+">

OtoT BYTE num1
TtoO BYTE num2
Plus BYTE func

.code
main PROC

	INVOKE ExitProcess,0
main ENDP
END main