assume cs:code, ds:data
data segment
	a dd 12a4h
data ends

code segment
start:
    mov ax, data
    mov ds, ax
	mov es, ax
	mov ax, word ptr a[0]
	
	
    ; Terminam programul
    mov ax, 4c00h
    int 21h

code ends
end start