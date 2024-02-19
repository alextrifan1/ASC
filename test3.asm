assume cs:code, ds:data
data segment
	n dw 2559
	sir db 21 dup(0)
data ends
code segment
start:
    mov ax, data
    mov ds, ax
	
	; punem fiecare cifra in sir
	mov bl, 10
	mov ax, n
	; avem nr in ax
	mov si, 0
	pune:
		div bl ;ah rest, al cat
		add sir[si], ah ;am pus restul in sir
		
		mov ah, 0
		
		add si, 1
		cmp al, 0
		jne pune 
	
	sub si,1
	mov cx, si
	repeta:
		mov al, sir[si]
		;afisam carcaterul
		add al, '0'
		mov ah, 02h
		mov dl, al
		int 21h
		sub si, 1
	loop repeta
	
	;ultima cifra
	mov al, sir[0]
	add al, '0'
	mov ah, 02h
	mov dl, al
	
	int 21h
    mov ax, 4c00h
    int 21h

code ends
end start
