;Se citeste de la tastatura un numar. 
;Sa se afiseze acest numar incrementat cu 1.

assume cs:code, ds:data
data segment
     a db 20, ?, 20 dup(?)
	 b db 20 dup(?)
	 nr db 0
	 lb db 0
	 vfStiva db 0
data ends
code segment
start:
    mov ax, data
    mov ds, ax

    ;citim numarul drept sir
	mov ah, 0Ah
	mov dx, offset a 
	int 21h
	;calculam lungimea sirului
	mov al, byte ptr a[1]
	mov ah, 0
    mov cx, ax
	mov si, 2
	repeta:
		mov dl, a[si]
		sub dl, '0'
		mov dh, 0
		;punem cifrele intr-o stiva
		push dx 
		add vfStiva, 1
		add si, 1
	loop repeta
	mov cl, vfStiva
	mov ch, 0 
	repeta2:
		pop dx
		mov al, nr 
		mov bl, 10
		mul bl
		add al, dl 
		mov nr, al 
	loop repeta2
	;adaugam 1
	mov al ,nr 
	add al, 1
	;punem iar in stiva 
	mov vfStiva, 0; poate avem mai multe cifre 
	mov ah, 0
	mov bl, 10
	puneStiva:
		div bl 
		mov dl, ah 
		add dl, '0'
		mov dh, 0
		push dx
		mov ah, 0
		add vfStiva, 1
		
		cmp al, 0
		jne puneStiva
	sub vfStiva, 1
	mov cl, vfStiva
	mov ch, 0
	
	mov dl, 10 
	mov ah, 02h
	int 21h
	
	repeta3:
		pop dx 
		mov ah, 02h
		int 21h
	loop repeta3
	
    ; Terminam programul
    mov ax, 4c00h
    int 21h

code ends
end start
