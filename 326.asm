;Se da un sir S de dublucuvinte. 
;Sa se obtina sirul D format din octetii inferiori ai cuvintelor inferioare 
;din elementele sirului de dublucuvinte, care sunt multiplii de 7. 
;Exemplu:
;s DD 12345607h, 1A2B3C15h, 13A33412h
;d DB 07h, 15h

assume cs:code, ds:data
data segment
	s dd 12345607h, 1A2B3C15h, 13A33412h
	ls equ ($-s)/4
	d db ls dup(0)
	aux dw ?
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	mov es, ax
	; start cod 
	mov si, offset s 
	mov di, offset d 
	mov cx, ls 
	cld
	parcurgere:
		lodsw; di:si -> ax, si = si+2
		mov aux, ax; in ax e cuvantul inferior 
		mov bl, 7
		idiv bl; impartim dx:ax la 7
		cmp ah, 0
		je divizibil
		jne nedivizibil
		divizibil:
			mov bl, byte ptr aux[0]
			mov d[di], bl 
			add di, 1
		nedivizibil:
			add di, 0
	loop parcurgere
	mov ax, 4c00h
	int 21h
code ends 
end start