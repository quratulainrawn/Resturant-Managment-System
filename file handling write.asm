REG_M:
		INVOKE MSG_DISPLAY, ADDR REG_MSG          ;INVOKE STRING_INPUT, ADDR INPUT_STRING

	MOV ESI, OFFSET MEMBERS
	MOV EAX, MEMBER_SIZE
	MUL NUM_MEMBERS
	ADD ESI, EAX
	MOV EDX, ESI
	MOV ECX, MEMBER_SIZE
	CALL READSTRING
	mov m_sizee,eax
	INC NUM_MEMBERS

	INVOKE CreateFile, ADDR MEMBERS_FILE, FILE_APPEND_DATA, 0, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
    
	MOV filehandle, EAX
 
	INVOKE WriteFile, filehandle,ESI, m_sizee, ADDR bytesRead, NULL