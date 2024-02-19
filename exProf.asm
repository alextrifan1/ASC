;se da un sir de octeti. creati un nou sir de aceeasi lungime,
;care va contine doar acei octeti dinn primul sir care au numarul de biti 1
;mai mare decat numarul de biti 0 sau acei octeti care au val cuprinsa intre
;[1Fh,60h] in rest cel de al 2-lea sir se va completa cu 0

;sir db -2, 2, -10, 40, 100, 0, 96

assume cs:code, ds:data
data segment
	sir db -2, 2, -10, 40, 100, 0, 96
	l equ $-sir
	sir_rez db l dup(?)
	cate db 0

data ends
code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax
	mov cx, l; punem in cx val lung sirului
	mov si, offset sir
	mov di, offset sir_rez
	cld
	repeta:
		lodsb; ds:si -> al , si = si +1
		mov cate, 0
		mov bx,cx ; copiem cx in bx deoarece il vom distruge pe cx in a 2 a structura repetitiva
		mov cx, 8; punem in cx deoarece, 8  deoarece avem 8 biti de parcurs
		mov ah, al; copiem val lui al im ah ptc distrugem al cand parcurgem
		suma:
			shl ah, 1
			adc cate, 0
			clc 
		loop suma ; cu struct asta rep ne facem bitii de 1
		
		cmp cate, 5
		jae adauga ;daca byte-ul are mai multi biti de 1 decat de 0 atunci il adaugam
		cmp al, 1Fh
		jl exit_mai_mic
		cmp al, 60h
		jng adauga ; jng =jump if not greater
		exit_mai_mic:
			mov al, 0
		
		adauga:
			stosb ; adauga in sir_rez 0 sau byet-ul gasit in al es:di <- al, di = di +1
		mov cx,bx
	loop repeta 
	mov ax, 4c00h
	int 21h
code ends 
end start