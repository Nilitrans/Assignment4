# CS-2208-Assignment4-uwo
		AREA question1, CODE,READWRITE
		ENTRY
		ADR R1, STRING1	    ;load the string
		ADR R6, STRING2		;load the empty string
		MOV R5,#'t'									  
SEARCH	LDRB R2,[R1],#1     ; search the character in string if find a t go and check if it is
		CMP R2,#'t'			; "the_" if not just store
		BEQ CHECKthe
		BNE STORE
CHECKthe MOV R3,R1			; check loop
		LDRB R4,[R1,#-2]	; move the pointer 2 byte forward the string
		CMP R4,#0x20		; check whether it is a space
		BNE STOREt			; if not that means cannot be the word " the",then store it
		LDRB R4,[R1]		; check the character that the pointer is currently pointing to
		CMP R4,#'h'			; if it is not "h" then store
		BNE STORE
		LDRB R4,[R1,#1]		; move the pointer afterward by 1 byte
		CMP R4,#'e'			; check if it is a "e"
		BNE STORE			; if not store
		LDRB R4,[R1,#2]		; if the previous check all past finally move the pointer 2 bytes afterward
		CMP R4,#0x20		; just check whether it is a space all null
		CMPNE R4,#0x00		; if it is either a null or a space just skip the word
		ADDEQ r1,r1,#3		; "the_" and load and store the after
		BNE STOREt2
		BEQ SEARCH
STOREt2 STRB R5,[R6],#1
		B SEARCH
STOREt	STRB R5,[R6]		; if "the" is in the middle of a word, just make up and store the "miss" "t"
		B SEARCH	
STORE 	STRB R2,[R6],#1		; store loop
		CMP R2,#0x00		; check wheter it is the EoS
		BNE SEARCH			; if not keep searching 
		B EXIT	
EXIT 	B EXIT

		
	
		AREA question1, DATA ,READWRITE
STRING1 DCB "and the man said they" ;String1
EoS DCB 0x00 ;end of string1
STRING2 space 0xFF ;just allocating 255 bytes 
	END
