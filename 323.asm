;Se da un sir A de cuvinte. Construiti doua siruri de octeti  
;- B1: contine ca elemente partea superioara a cuvintelor din A
;- B2: contine ca elemente partea inferioara a cuvintelor din A 


assume cs:code, ds:data
data segment
	a dw 7,8,14,13
	ls equ ($-a)/2
	b1 db ls dup(0)
	b2 db ls dup(0)
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax
	;problema
	mov si, offset a 
	mov di, offset b1 
	mov bp, offset b2 
	mov cx, ls
	cld 
	parcurgere:
		lodsw; di:si -> ax, si = si+2
		mov b1[di], ah
		mov b2[bp], al
		add di, 1
		add bp, 1
	loop parcurgere
	mov ax, 4c00h
	int 21h
code ends 
end start