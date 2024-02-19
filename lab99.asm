assume cs:code, ds:data
data segment
    mesaj db 'Introduceti sirul de caractere (terminati cu Enter): $'
    litere_mici db 0 ; Contor pentru literele mici
    sir_input db 50,?,50 dup(0)
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    introducere_sir:
        mov ah, 09h; afisam mesajul pentru introducerea sirului
        mov dx, offset mesaj
        int 21h

        mov ah, 0Ah; citim sirul de la tastatura
        mov dx, offset sir_input
        int 21h

        mov si, 0

        ; Resetam contorul pentru literele mici
        mov byte ptr [litere_mici], 0

        afisare_lit_mici:
            mov al, byte ptr sir_input[si]
            cmp al, 13 ; verificam sfarsitul sirului introdus (Enter)
            je iesire_comp

            ; Verificam daca caracterul este o litera mica
            cmp al, 'a'
            jl nu_este_litera_mica
            cmp al, 'z'
            jg nu_este_litera_mica

            ; Daca caracterul este o litera mica, il afisam
            mov ah, 02h
            mov dl, al
            int 21h

            ; Incrementam contorul pentru literele mici
            inc byte ptr [litere_mici]

            nu_este_litera_mica:

            ; Continuam afisarea si verificarea
            inc si
            jmp afisare_lit_mici

        iesire_comp:
            ; Afisam newline (nu mai este necesar, deoarece trecem direct la sfarsitul programului)
            
    mov ax, 4C00h
    int 21h
code ends
end start