; Se da un sir de octeti in segmentul de date.
;Sa se afiseze elementele acestui sir la iesirea standard (ecran) in baza 2.

assume cs:code, ds:data
data segment
	s db 15, 10
	ls equ $-s
	aux dw ?; pt cx
	auxAL db ?
	opt db 8
	cf db ?
	cifre db 0
	cifre0 db 0
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	; start cod 
	mov si, 0 
	mov cx, ls 
	mov bl,2
	parcurgere:
		mov al, s[si]
		mov cifre,0
		punestiva:
			mov ah,0
			div bl
			mov dl,ah
			mov dh,0
			push dx
			inc cifre
			cmp al,0
			JNE punestiva
			
		mov al,8
		sub al,cifre
		mov cifre0,al
		afis0:
			mov dl,'0'
			mov ah, 02h
			int 21h
			sub cifre0,1
			cmp cifre0,0
			JNE afis0
		
		afisare:
			pop dx
			add dl,'0'
			mov ah, 02h
			int 21h
			dec cifre
			cmp cifre,0
			jne afisare
		add si,1
		mov dl, ' '
		mov ah, 02h
		int 21h
	loop parcurgere
	
	mov ax, 4c00h
	int 21h
code ends 
end start