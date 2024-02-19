assume cs:code, ds:data
data segment
    mesaj db 'Introduceti parola: $'
    mesaj_incorecta db 'Parola incorecta. Mai incercati.$'
    mesaj_corecta db 'Parola corecta. Autentificare reusita.$'
    parola_corecta db 'parola$'
    parola_input db 50,?,50 dup(0)
    newline db 10, 13, '$'
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    introducere_parola:
        mov ah, 09h; afisam mesajul pentru introducerea parolei
        mov dx, offset mesaj
        int 21h

        mov ah, 0Ah; citim parola de la tastatura
        mov dx, offset parola_input
        int 21h

        mov si, 0
        mov di, 0

        compara_parola:
			mov al, byte ptr parola_input[si]
            cmp al, '$' ; verificam sfarsitul sirului introdus
            je iesire_comp                       				; trebuie salvat sirul pe care il introduc, posibil si ceva la jne 
            cmp al, byte ptr parola_corecta[di]
            jne parola_incorecta
            inc si
            inc di
            jmp compara_parola
			
        parola_incorecta:
            mov ah, 09h; afisam mesajul pentru parola incorecta
            mov dx, offset mesaj_incorecta
            int 21h
            jmp introducere_parola

        iesire_comp:
            mov ah, 09h; afisam newline
            mov dx, offset newline
            int 21h

            mov ah, 09h; afisam mesajul pentru parola corecta
            mov dx, offset mesaj_corecta
            int 21h

    mov ax, 4C00h
    int 21h
code ends
end start