;Se sa citeasca un sir de cifre a. 
;Sa se salveze in sirul b doar cifrele pare. 
;Sa se afiseze sirul b pe ecran.

assume cs:code, ds:data
data segment
    a db 20, ?, 20 dup(?)
    b db 21 dup(?)
    nrPare db ?
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    ; Citim sirul de cifre
    mov ah, 0Ah
    mov dx, offset a 
    int 21h

    ; Initializam contorul pentru cifrele pare
    mov nrPare, 0

    ; Calc lungimea sirului
	mov al, byte ptr a[1]
	mov ah, 0
    mov cx, ax
    mov si, 2; sir a
    mov di, 0; sir b
    repeta:
        ;luam cifra
        mov al, a[si]
        sub al, '0'
		; trecem in ax si impartim la 2
		mov ah, 0
		mov bl, 2
		div bl 
		cmp ah, 0
		je par 
		jne skip
		par:
			;punem in sirul b
			mov al, a[si]
			mov b[di], al
			add di, 1
		skip:
		add si, 1
    loop repeta
	
	;punem $ la final
	mov b[di], '$'

	; afisam o linie sa fie mai frumos ;)
	
	mov ah, 02h
	mov dl, 10
	int 21h
	
    ; Afisam sirul b
    mov ah, 09h
    mov dx, offset b
    int 21h

    ; Terminam programul
    mov ax, 4c00h
    int 21h

code ends
end start
