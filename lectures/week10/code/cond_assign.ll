mpi_safe_cond_assign(unsigned char*, unsigned char const*, unsigned char):
        test    dl, dl
        setne   al
        je      .LBB0_2
        mov     dl, byte ptr [rsi]
.LBB0_2:
        or      al, -2
        inc     al
        and     al, byte ptr [rdi]
        add     al, dl
        mov     byte ptr [rdi], al
        ret
