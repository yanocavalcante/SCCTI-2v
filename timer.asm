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

   	# sw $a0, tempo_inicial
	li $s0, 0

	# Loop que verifica a passagem de 1 segundo
	loop_timer_check:
		# Le o tempo atual
		li $v0, 30
		syscall
		
		# Subtrai o tempo atual pelo inicial (calculado no ultimo 'check' ou na inicializacao)
		subu $t1, $a0, $t0
		
		# Guarda a leitura mais recente de tempo em $t0
		# move $t0, $a0
		
		li $t2, 1000
		bgtu $t1, $t2, passed
		
		j loop_timer_check
	
	# Se passou 1 segundo desde a ultima medicao	
	passed:
		move $t0, $a0
		
		# Incrementa em 1 o registrador que representa os segundos decorridos
		addi $s0, $s0, 1
		
		# Atualiza o display com os segundos decorridos
		move $a0, $s0
		jal UpdateTimerDisplay
		
		# Se o tempo decorrido em segundos for igual ao tempo requisitado pelo estado dos semaforos (armazenado em $a2) a funcao retorna
		bge $s0, $a2, return
		
		j loop_timer_check
		
	return:
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addiu $sp, $sp, 8
		jr $ra
