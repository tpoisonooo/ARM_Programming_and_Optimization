.equ N,32768
.comm data,N*4,4
.global main
.arch armv8-a

main:
    ldr w1,=N
    sub w1,w1,#1  //r1=N-1
    mov w5,#0

oloop:
    cmp w5,w1
    beq exito

    mov w3,#0   // j=0
    ldr x2,=data    // r2=&data
    
    ldr w11,[x2]

iloop:
    cmp w3,w1       // j==N-1?
    beq exiti
    ldr w10,[x2,#4] // data[j+1]
    cmp w11,w10
    ble next
    stp w10,w11,[x2]
next:
    mov w11,w10

    add w2,w2,#4
    add w3,w3,#1    // ++j
    b iloop

exiti:
    add w5,w5,#1
    b oloop

exito:
    ret
