.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
Sun EQU <1>
Mon EQU <2>
Tue EQU <3>
Wed EQU <4>
Thu EQU <5>
Fri EQU <6>
Sat EQU <7>


Week BYTE Sun,Mon,Tue,Wed,Thu,Fri,Sat

.code
main PROC

	INVOKE ExitProcess,0
main ENDP
END main