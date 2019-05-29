.align 5
.global main
.arch armv8-a

main:
    mov w0,wzr
    rbit w2,w0
    ret
