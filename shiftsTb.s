#0 addi x1, x0, 2
#1 addi x2, x0, -3
#2 sra x2, x2, x1 // x2 = -1
#3 sw x2, 100(x0) // mem[100] = -1
#4 sll x2, x2, x1 // x2 = -4
#5 sw x2, 104(x0) // mem[104] = -4
#6 srl x2, x2, x1 // x2 = 001111 1111 1111 1111 1111 1111 1111 11 = 0x3FFFFFFF
#7 sw x2, 108(x0) // mem[108] = 0x3FFFFFFF
