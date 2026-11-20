.eqv DISPLAY_RIGHT,     0xFFFF0010
.eqv DISPLAY_LEFT,      0xFFFF0011

.eqv BOTH_RED, 0x7F
.eqv PGREEN_SRED, 0x36
.eqv PYEL_SRED, 0x7D
.eqv PRED_SGREEN, 0x49
.eqv PRED_SYEL, 0x79

.text
.globl InitializeTrafficLights
.globl BothRed
.globl PGreen_SRed
.globl PYel_SRed
.globl PRed_SGreen
.globl PRed_SYel

# Inicializa os semáforos na configuração: Via Principal (Verde) e Via Secundária (Vermelha)
InitializeTrafficLights:
	li $t0, DISPLAY_LEFT
	li $t1, PGREEN_SRED
	sb $t1, 0($t0)

	li $t0, DISPLAY_RIGHT
	sb $zero, 0($t0)
	jr $ra

# Responde ao sinal de um sensor acendendo todos os segmentos da esquerda, ou seja, os dois semáforos ficam vermelhos.
BothRed:
	li $t0, DISPLAY_LEFT
	li $t1, BOTH_RED
	sb $t1, 0($t0)
	
	li $a2, 5 # "Pede" 5 segundos ao temporizador
	
	jr $ra

PGreen_SRed:
	li $t0, DISPLAY_LEFT
	li $t1, PGREEN_SRED
	sb $t1, 0($t0)
	
	jr $ra

PYel_SRed:
	li $t0, DISPLAY_LEFT
	li $t1, PGREEN_SRED
	sb $t1, 0($t0)
	
	jr $ra

PRed_SYel:
	li $t0, DISPLAY_LEFT
	li $t1, PRED_SYEL
	sb $t1, 0($t0)
	
	jr $ra
	
PRed_SGreen:
	li $t0, DISPLAY_LEFT
	li $t1, PGREEN_SRED
	sb $t1, 0($t0)
	
	jr $ra
