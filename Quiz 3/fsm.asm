INCLUDE Irvine32.inc

.data
prompt BYTE "Inpute: ",0
standard BYTE "Summer 2020 CIS 335",0
input BYTE 50 dup(?)

invalid BYTE "Invalid input",0
valid BYTE "valid input",0

.code
main PROC
	Call Clrscr
	Mov edx, OFFSET prompt 
	Call WriteString

	Mov edx, OFFSET input
	Mov ecx, LENGTHOF input
	Call ReadString

	Mov esi, OFFSET input
	Mov edi, OFFSET standard
	Mov ecx, LENGTHOF standard

	Repe CMPSB
	Dec esi
	Dec edi
	CMPSB
	JE L1
	Mov edx, OFFSET invalid
	Call WriteString
	JMP L2
L1:
	Mov edx, OFFSET valid
	Call WriteString
L2:

	INVOKE ExitProcess,0
main ENDP
END main