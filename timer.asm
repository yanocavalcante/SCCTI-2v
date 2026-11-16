# Timer Management File
.globl timer_init
.globl timer_check

.data
	tempo_inicial: .word 0
	
.text
timer_init:
	# Inicia o relógio
	li $v0, 30
   	syscall
   	sw $a0, tempo_inicial
   	jr $ra

timer_check:
	# Lê o tempo atual
	li $v0, 30
	syscall
	# Subtrai o tempo atual pelo inicial
	lw $t0, tempo_inicial
	sub $t1, $a0, $t0
	li $t2, 1000
	blt $t1, $t2, zero
	# Se passou 1 segundo desde a primeira medição
	sw $a0, tempo_inicial
	li $v0, 1
	jr $ra
	
zero:
	# Ainda não se passou 1 segundo desde a primeira medição
	li $v0, 0
	jr $ra
