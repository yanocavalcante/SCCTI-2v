# Timer Management File
.globl TimerCheck

.data
	tempo_inicial: .word 0
	
.text

TimerCheck:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	li $v0, 30
   	syscall
   	sw $a0, tempo_inicial
	li $s0, 0

	loop_timer_check:
	
		# Atualiza o display com os segundos decorridos
		move $a0, $s0
		jal display_atualizar_tempo
	
		# LÃª o tempo atual
		li $v0, 30
		syscall
		
		# Subtrai o tempo atual pelo inicial (calculado no ultimo 'check' ou na inicializacao)
		lw $t0, tempo_inicial
		subu $t1, $a0, $t0
		
		li $t2, 1000
		bltu $t1, $t2, zero
		
		# Se passou 1 segundo desde a primeira mediÃ§Ã£o
		sw $a0, tempo_inicial
		
		# Incrementa em 1 o registrador que representa os segundos decorridos
		addi $s0, $s0, 1
		
		# Se o tempo decorrido em segundos for igual ao tempo requisitado pelo estado dos semaforos (armazenado em $a2) a funï¿½ï¿½o retorna
		bge $s0, $a2, return
		
		j loop_timer_check
		
	zero:
		# Ainda nÃ£o se passou 1 segundo desde a primeira mediÃ§Ã£o
		j loop_timer_check
		
	return:
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addiu $sp, $sp, 8
		jr $ra
