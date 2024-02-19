; test pt impartiri

assume cs:code, ds:data
data segment
	s dd 12345607h, 1A2B3C15h
	ls equ ($-s)/4
	divizor dd 7
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax
	; start cod 
	mov si, 0
	mov cx, ls
	repeta:
		mov ax, word ptr s[si+0]
		mov dx, word ptr s[si+2]
		div divizor
		add si, 4
	loop repeta
	mov ax, 4c00h
	int 21h
code ends 
end start