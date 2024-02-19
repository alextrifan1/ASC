assume cs:text_,ds:data_

data_ segment
sir db 20, ?, 20 dup(0)
cifre db 0
numar dw 0
data_ ends
text_ segment

start:
    mov ax, data_
    mov ds, ax
	
	;citim sir
	mov ah, 0Ah
	mov dx, offset sir
	int 21h
	
	;lungime
	mov si,1
	mov al, sir[si]
	mov ah, 0
	mov cx,ax
	inc si
	;punem pe stiva cifrele
	repeta:
		mov al, sir[si]
		sub al,'0'
		mov ah, 0
		mov dx,ax
		push dx
		inc si
	loop repeta
	
	;pregatim constructia
	mov bx,1;puterile lui 10
	mov si,1
	mov al, sir[si]
	mov ah, 0
	mov cx,ax
	;abc = c*1 + b*10 + a*100
	construieste:
		pop dx
		mov ax,dx
		mov dx,0; eliberam dx din dx:ax
		mul bx; inmultim cu puterea lui 10
		add numar,ax; adaugam la numarul vechi cifra*pow(10, bx)
		
		mov ax,bx; facem urmatoarea putere a lui 10
		mov dx,10
		mul dx
		mov bx, ax
	loop construieste
	
	inc numar; adaugam 1 la numar 
	
	mov bx,10
	mov ax,numar
	mov dx,0
	puneStiva:
		inc cifre
		div bx
		push dx
		mov dx,0
		cmp ax,0
		JNE puneStiva
	Afisare:
		pop dx
		add dx,'0'
		mov ah,02h
		int 21h
		dec cifre
		cmp cifre,0
		JNE Afisare
	
	mov ax, 4c00h      
    int 21h  

	text_ ends
	end start