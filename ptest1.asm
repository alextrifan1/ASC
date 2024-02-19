assume cs:code, ds:data
data segment
	sir1 db 20,?,20 dup(0)
	sir2 db 20,?,20 dup(0)
	linie db 10, 13, 10
	mesajBun db 'e oglindit','$'
	mesajRau db 'nu e oglindit','$'
	aux dw ?
data ends
code segment
;daca construiesc un sir si vreau sa il afisez trebuie sa adaug $ la final
start:
	mov ax, data
	mov ds, ax
	; start cod
	
	;citim sirul1
	mov ah, 0Ah
	mov dx, offset sir1 
	int 21h
	
	;afisam linie noua
	
	mov ah, 02h
	mov dl, 10
	int 21h
	
	;citim sirul2
	mov ah, 0Ah
	mov dx, offset sir2 
	int 21h
	
	;calculam lungimea sirului
	mov al, byte ptr sir2[1]
	mov ah, 0
	mov cx, ax 
	mov aux, cx
	
	mov si, 2
	;parcurgem primul sir si il punem in stiva
	repeta:
		mov al, sir1[si]
		mov dl, al 
		mov dh, 0
		push dx 
		add si, 1
	loop repeta
	
	mov cx, aux
	mov si, 2
	repeta2:
		mov al, sir2[si]
		pop dx
		cmp al, dl 
		jne rau
		add si, 1
	loop repeta2
	bun:
		mov ah, 09h         
		mov dx, offset mesajBun
		int 21h 
		jmp final
	rau:
		mov ah, 09h         
		mov dx, offset mesajRau
		int 21h 
	final:
	mov ax, 4c00h
	int 21h
code ends 
end start