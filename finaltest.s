j start
labelEr:addi x1, x0, 0 # x1 = 0
		sw x1, 252(x0) # put the wrong value in the mamory
start:  lui x1, 1 # x1 = 4096
		addi x2, x0, 2 #x2 = 2
		addi x3, x0, -3 #x3 = -3
		bge x2, x3, label1 #should be taken
		addi x1, x0, 0 # x1 = 0
        sw x1, 252(x0) # put the wrong value in the mamory
label1:	sltu x4, x2, x3 # x4 = 1
		bne x4, x2, label2 #should be taken
        addi x1, x0, 0 #x1 = 0
        sw x1, 252(x0) # put the wrong value in the mamory
label2:	xor x5, x2, x3 #x5 = -1
		blt x5, x3, labelEr #should not be taken
        sltu x6, x5, x3 # x6 = 0
        bltu x2, x5, label3 #should be taken
       	addi x1, x0, 0 # x1 = 0
        sw x1, 252(x0) # put the wrong value in the mamory 
label3: slli x7, x5, 4 #x7 = -16
		bgeu x5, x7, label4 # should be taken
        addi x1, x0, 0 # x1 = 0
        sw x1, 252(x0) # put the wrong value in the mamory
label4: srai x1, x1, 2 # x1 = 1024
		sltiu x1, x1, -2048 # x1 = 1
        slli x1, x1, 13 # x1 = 8192
        srli x1, x1, 1 # x1 = 4096
        srai x7, x7, 4 # x7 = -1
        xori x7, x7 ,-1 # x7 = 0
        addi x7, x7, 176
        bge x5, x5, label5 #should be taken
        addi x1, x0, 0 # x1 = 0
        sw x1, 252(x0) # put the wrong value in the mamory
label5:	bge x3, x0, labelEr #should not be taken
		bgeu x5, x5, label6 #should be taken
        addi x1, x0, 0 # x1 = 0
        sw x1, 252(x0) # put the wrong value in the mamory
label6:	blt x5, x0, label7 #should be taken
		addi x1, x0, 0 # x1 = 0
        sw x1, 252(x0) # put the wrong value in the mamory
label7:	bltu x5, x0, labelEr 
		bgeu x0, x5, labelEr #both should not be taken
        jalr x8, x7, 0
		addi x1, x0, 0 # x1 = 0
        sw x1, 252(x0) # if x1 == 4096 => correct else not correct   