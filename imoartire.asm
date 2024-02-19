; test pt impartiri

assume cs:code, ds:data
data segment
	s dd 14
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax
	; start cod 
	mov ax, word ptr s[0]
	mov dx, word ptr s[2]
	mov bx, 7
	div bx
	mov ax, 4c00h
	int 21h
code ends 
end start