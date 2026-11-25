# Timer Management File
.globl TimerCheck

.text

TimerCheck:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	li $v0, 30
   	syscall  	
   	move $t0, $a0

	li $s0, 0 # Contador de segundos "inteiros"

	# Loop que verifica a passagem de 1 segundo
	loop_timer_check:
		# Le o tempo atual
		li $v0, 30
		syscall
		
		# Subtrai o tempo atual pelo inicial (calculado no ultimo 'check' ou na inicializacao)
		subu $t1, $a0, $t0
		li $t2, 1000
		bltu $t1, $t2, loop_timer_check
	
	passed:
		# Adiciona exatamente 1000 ms (1 segundo) ao temporizador
		addiu $t0, $t0, 1000
		addi $s0, $s0, 1
		move $a0, $s0
		
		jal UpdateTimerDisplay
		
		bge $s0, $a2, return
		
		j loop_timer_check
		
	return:
		jal InitializeTimerDisplay
		
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addiu $sp, $sp, 8
		
		jr $ra
