.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
DWORD 120 Dup(?)				;array of 120 unitializded unsigned doubleword values
BYTE "abcde"					;array of bytes initialized to first five letters fo alphabet
Sec1Array WORD 1,2,3			;16 bit integer that uses 3 initializers
Color BYTE "Purple",0			;Variable with favorit color
Array1 SDWORD 10 Dup(?)			;Uninitiailized array named Array1 of signed Double words
BYTE 100 Dup("Sec1TEST")		;Array of the string "Sec1TEST" 100 times
bArray1 BYTE 1000 Dup(0)		;Array of 1000 bytes iniitialized to 0

.code
main PROC

	INVOKE ExitProcess,0
main ENDP
END main