# Timer Management File
.globl TimerInit
.globl TimerCheck

.data
	tempo_inicial: .word 0
	
.text
TimerInit:
	# Inicia o relógio
	li $v0, 30
   	syscall
   	sw $a0, tempo_inicial
   	jr $ra

TimerCheck:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)

	loop_timer_check:
		# Lê o tempo atual
		li $v0, 30
		syscall
		
		# Subtrai o tempo atual pelo inicial (calculado no ultimo 'check' ou na inicializacao)
		lw $t0, tempo_inicial
		subu $t1, $a0, $t0
		
		li $t2, 1000
		bltu $t1, $t2, zero
		
		# Se passou 1 segundo desde a primeira medição
		sw $a0, tempo_inicial
		
		# Incrementa em 1 o registrador que representa os segundos decorridos
		addi $t3, $t3, 1

		# Atualiza o display com os segundos decorridos
		move $a0, $t3
		jal display_atualizar_tempo
		
		# Se o tempo decorrido em segundos for igual ao tempo requisitado pelo estado dos semaforos (armazenado em $a2) a fun��o retorna
		bge $t3, $a2, return
		
		j loop_timer_check
		
	zero:
		# Ainda não se passou 1 segundo desde a primeira medição
		j loop_timer_check
		
	return:
		lw $ra, 0($sp)
		addiu $sp, $sp, 4
		jr $ra
