; se citeste de la tastatura un sir care contine litere
; si cifre. Sa se afiseze pe ecran sirul cifrelor
; din sirul initial

;ex: ana are 10 mere -> 1 0
assume cs:code, ds:data
data segment
	sir db 20, ?, 20 dup(0)
	cifre db 20 dup(0)
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	; start cod 
	mov ah, 0Ah; citire sir pana la enter
	mov dx, offset sir 
	int 21h
	;calculam lungimea sirului
	mov al, byte ptr sir[1]
	mov ah, 0
	mov cx, ax; lungimea sirului 
	mov si, 2; de unde incepe sirul 
	mov di, 0; pt cifre
	repeta:
		mov al, sir[si]
		cmp al, '0'
		jl next
		jge comp_9
		comp_9:
			cmp al, '9'
			jg next
			jle adaugaCifra
		adaugaCifra:
			mov cifre[di], al 
			add di, 1
		next:
			add si, 1
	loop repeta
	;printare
	mov ah, 09h
	mov dx, offset cifre
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends 
end start