MEMBERS_FILE   BYTE "C:\EMU8086\MySource.txt",0


; VIEW MEMBERS FROM FILE
VIEW_MFILE:
	INVOKE CreateFile,
	    ADDR MEMBERS_FILE, ; ptr to filename
	    GENERIC_READ, ; mode = Can read
	    DO_NOT_SHARE, ; share mode
	    NULL, ; ptr to security attributes
	    OPEN_ALWAYS, ; open an existing file
	    FILE_ATTRIBUTE_NORMAL, ; normal file attribute
	    0 ; not used
	mov filehandle, eax ; Copy handle to variable
	
	invoke ReadFile,
	    filehandle, ; file handle
	    addr BUFFER_MEM, ; where to read
	    BUFFER_SIZE, ; num bytes to read
	    addr bytesRead, ; bytes actually read
	    0
	invoke CloseHandle,
	filehandle
	mov edx, offset BUFFER_MEM ; Write String
	call WriteString
	JMP START