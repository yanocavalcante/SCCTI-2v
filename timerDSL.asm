# Timer's Digital SimLab Interface
.globl display_atualizar_tempo
.globl display_apagar_tempo

.data
	# Índices:               0     1     2     3     4     5     6     7     8     9
   	tabela_7seg: .byte     0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F
	
.text
display_atualizar_tempo:
	# Busca o byte correspondente na tabela
	la $t1, tabela_7seg
	add $t1, $t1, $a0
	lb $t2, 0($t1)

	# Escreve no Digital Lab Sim
	li $t3, 0xFFFF0010	# Endereço do segundo display
	sb $t2, 0($t3)		# Envia o byte para acender o display
	jr $ra
	
display_apagar_tempo:
	# Apaga todos os segmentos
	li $t0, 0xFFFF0010	# Endereço do segundo display
	sb $zero, 0($t0)	# Envia o byte para apagar o display
	jr $ra
