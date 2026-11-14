.eqv DISPLAY_RIGHT,     0xFFFF0010
.eqv DISPLAY_LEFT,      0xFFFF0011
.eqv VERTICAL_SEGMENTS, 0x36
.eqv ALL_SEGMENTS,      0x7F

.text
.globl InitializeTrafficLights
.globl BothRed

# Inicializa os semáforos na configuração: Via Principal (Verde) e Via Secundária (Vermelha)
InitializeTrafficLights:
	li $t0, DISPLAY_LEFT
	li $t1, VERTICAL_SEGMENTS
	sb $t1, 0($t0)

	li $t0, DISPLAY_RIGHT
	sb $zero, 0($t0)
	jr $ra

# Responde ao sinal de um sensor acendendo todos os segmentos da esquerda, ou seja, os dois semáforos ficam vermelhos.
BothRed:
	li $t0, DISPLAY_LEFT
	li $t1, ALL_SEGMENTS
	sb $t1, 0($t0)
	jr $ra
