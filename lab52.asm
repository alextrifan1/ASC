assume cs:code, ds:data
data segment
    mesaj db 'Introduceti parola: $'
    mesaj_corecta db 'Parola corecta!$'
    mesaj_gresita db 'Parola gresita! Incercati din nou.$'
    parola_corecta db 'parola$'
    sir db 10,?,10 dup(0)
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    mov ah, 09h ; afisam mesajul
    mov dx, offset mesaj
    int 21h

    mov ah, 0Ah ; citim sirul de caractere pana la introducerea ENTER
    mov dx, offset sir
    int 21h

    mov cl, byte ptr sir[1] ; in cx este lungimea sirului
    mov si, 2

    ; Verifica daca sirul introdus este identic cu parola_corecta
    mov di, 0 ; index pentru sir
    mov bx, offset parola_corecta ; adresa la care incepe sirul 'parola$'

    compara:
        cmp di, cl ; verifica daca am ajuns la sfarsitul sirului introdus
        je parola_gresita ; daca da, parola este gresita

        mov al, byte ptr [bx] ; caracterul curent din parola_corecta
        cmp al, '$' ; verificam daca am ajuns la sfarsitul sirului parola_corecta
        je parola_corecta ; daca da, parola este corecta

        cmp al, byte ptr [si] ; compara caracterele din sirul introdus cu parola_corecta
        jne parola_gresita ; daca nu coincid, parola este gresita

        inc di ; trecem la urmatorul caracter din sir
        inc si ; trecem la urmatorul caracter din sirul introdus
        inc bx ; trecem la urmatorul caracter din parola_corecta
        jmp compara ; repetam procesul

    parola_corecta:
        mov ah, 09h
        mov dx, offset mesaj_corecta ; afisam mesajul 'Parola corecta!'
        int 21h
        jmp final_program

    parola_gresita:
        mov ah, 09h
        mov dx, offset mesaj_gresita ; afisam mesajul 'Parola gresita! Incercati din nou.'
        int 21h
        jmp start ; revenim pentru a introduce parola din nou

    final_program:
        mov ax, 4C00h
        int 21h
code ends
end start