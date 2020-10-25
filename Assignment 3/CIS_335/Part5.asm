INCLUDE Irvine32.inc

.data
var1 DWORD 5 dup(?)

;Test Procedure FillArray
.code
main PROC
	MOV eax, 100
	MOV ebx, 25
	MOV ecx, 5
	MOV edx, OFFSET var1
	CALL FillArray

	INVOKE ExitProcess,0
main ENDP

;FillArray
;Fills an array of doublewords with N random numbers within the range of j to k inclusive
;Recieves: EAX = K, EBX = j, ECX = N, EDX = pointer to doubleword array

FillArray PROC
	PUSHAD
	CALL Randomize
	SUB eax, ebx
	INC eax

L1:
	PUSH eax
	CALL RandomRange
	ADD eax, ebx
	MOV [edx], eax
	ADD edx, Type DWORD
	POP eax
	LOOP L1

	POPAD
	ret
FillArray ENDP

END main