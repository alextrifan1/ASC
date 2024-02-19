assume cs:code, ds:data
data segment
    n db 8
	pas db 0
	vfStiva db ?
	aux db ?
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    ; Citim sirul de cifre
    mov ax, data
    mov ds, ax
	
	mov al, n
	mov ah, 0
	mov cx, ax 
	
	parcurge:
		mov al, pas 
		mov ah, 0
		mov bl, 2 
		mul bl 
		add ax, 1
		
		spargeNr:
				mov bl, 10
				div bl 
				mov dl, ah 
				add dl, '0'
				mov ah, 02h
				int 21h
				mov ah, 0
				cmp al, 0
			;jne spargeNr
			
		mov dl, ','
		mov ah, 02h
		int 21h
		add pas, 1
	loop parcurge
    ; Terminam programul
    mov ax, 4c00h
    int 21h

code ends
end start
