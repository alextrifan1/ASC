;verificam daca un sir de la tastatura e palindrom

assume cs:code, ds:data
data segment
    sir db '21'
	ls equ $-sir
	msg_bun db 'DA $'
	msg_rau db 'NU $'
	
data ends
code segment
start:
    mov ax, data
    mov ds, ax
	
	mov si, 0
	mov di, ls 
	dec di 
	mov cx, ls
	
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
