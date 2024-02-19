assume cs:code, ds:data
data segment
    n db 3
    pas db 0
    vfStiva db ?
    aux db ?
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    ; Citim sirul de cifre
    mov al, n
    mov ah, 0
    mov cx, ax

    parcurge:
        ; Calculate the next number in the sequence (2n + 1)
        mov al, pas
        mov ah, 0
        mov bl, 2
        mul bl
        add ax, 1

        ; Display the current number
        spargeNr:
            mov bl, 10
            div bl
            add aux, '0'
            mov dl, aux
            mov ah, 02h
            int 21h

            mov al, ah ; Move the quotient back to al
            xor ah, ah  ; Clear the high byte

            cmp al, 0
            jne spargeNr

        ; Display a comma after each number (except the last one)
        mov dl, ','
        mov ah, 02h
        int 21h

        ; Move to the next number
        inc pas
		mov al, pas 
		cbw
        cmp ax, cx  ; Compare with the value of n
        jl parcurge   ; Jump back if pas is less than n

    ; Terminam programul
    mov ax, 4c00h
    int 21h

code ends
end start