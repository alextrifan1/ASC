;verificam daca un sir de la tastatura e palindrom

assume cs:code, ds:data
data segment
    sir db 20,?,20 dup(0)
	msg_bun db 'DA $'
	msg_rau db 'NU $'
	
data ends
code segment
start:
    mov ax, data
    mov ds, ax

	;citim sirul 
	mov ah, 0Ah
	mov dx, offset sir
	int 21h
	;linie noua
	mov ah, 02h
	mov dl, 10
	int 21h
	;calc lungimea
	mov al, byte ptr sir[1]
	mov ah, 0
    mov cx, ax
	mov si, 2
	mov di, cx 
	dec di 
	parcurgere:
		mov al, sir[si]
		mov bl, sir[di]
		cmp al, bl 
		jne nuE
		inc si
		dec di
		cmp si, di 
		jge gata
		jmp parcurgere
	nuE:
		mov ah, 09h
		mov dx, offset msg_rau
		int 21h
		jmp finfin
	gata:
		mov ah, 09h
		mov dx, offset msg_bun
		int 21h
	finfin:
	
    ; Terminam programul
    mov ax, 4c00h
    int 21h

code ends
end start
