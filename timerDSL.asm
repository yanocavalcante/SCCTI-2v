# Timer's Digital Lab Sim Interface
.eqv DISPLAY_RIGHT,     0xFFFF0010
.eqv DISPLAY_LEFT,      0xFFFF0011
.eqv ZERO, 0x3F

.globl UpdateTimerDisplay
.globl InitializeTimerDisplay

.data
# Indices:               0     1     2     3     4     5     6     7     8     9
sevenseg_table: .byte     0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F
	
.text

InitializeTimerDisplay:
	li $t0, DISPLAY_RIGHT	# Endereco do segundo display
	li $t1, ZERO
	sb $t1, 0($t0)

	jr $ra

UpdateTimerDisplay:
	# Busca o byte correspondente na tabela
	la $t1, sevenseg_table
	add $t1, $t1, $a0
	lb $t2, 0($t1)

	# Escreve no Digital Lab Sim
	li $t3, DISPLAY_RIGHT	# Endereço do segundo display
	sb $t2, 0($t3)		# Envia o byte para acender o display

	jr $ra
