
assume cs:code, ds:data
data segment
	n db '1234'
	ls equ $-n
data ends

code segment
start:
    mov ax, data
    mov ds, ax
	
	mov cx, ls
	mov si, 0
	repeta:
		mov al, n[si]
		
		mov ah, 02h
		mov dl, al
		int 21h
		
		add si, 1
	loop repeta
    
    mov ax, 4c00h
    int 21h

code ends
end start
