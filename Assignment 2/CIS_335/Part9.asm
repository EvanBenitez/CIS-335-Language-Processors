.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
one		BYTE	5Bh			;91d
two		SBYTE	96h			;-106d
three	WORD	789Ah		;30874d
four	SWORD	0CACDh		;-13611d
five	DWORD	0ABCDEF01h	;2882400001
six		SDWORD	0ABCDEF01h	;-1412567295

.code
main PROC

	INVOKE ExitProcess,0
main ENDP
END main