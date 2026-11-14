# Leitura dos sensores: teclas 1 e 2 do teclado do Digital Lab Sim.
.eqv KEYBOARD_CONTROL, 0xFFFF0012
.eqv KEYBOARD_DATA,    0xFFFF0014
.eqv FIRST_KEY_ROW,    0x01
.eqv KEY_1_CODE,       0x21 # Representa o Sensor de Veículo
.eqv KEY_2_CODE,       0x41 # Representa o Botão de Pedestre

.text
.globl main

main:
	jal InitializeTrafficLights
	move $s0, $zero                # Trava: evita repetir o sinal durante a mesma pressao.

MonitorSensors:
	jal ReadSensors
	beqz $v0, SensorsReleased
	bnez $s0, MonitorSensors

	li $s0, 1
	jal BothRed
	j MonitorSensors

SensorsReleased:
	move $s0, $zero
	j MonitorSensors

# Retorna $v0 = 1 quando a tecla 1 ou 2 for pressionada; caso contrario, 0.
ReadSensors:
	li $t0, KEYBOARD_CONTROL
	li $t1, FIRST_KEY_ROW
	sb $t1, 0($t0)

	li $t2, KEYBOARD_DATA
	lbu $t3, 0($t2)
	sb $zero, 0($t0)               # Reseta a selecao do teclado apos a leitura.

	li $t4, KEY_1_CODE
	beq $t3, $t4, SensorDetected
	li $t4, KEY_2_CODE
	beq $t3, $t4, SensorDetected

	move $v0, $zero
	jr $ra

SensorDetected:
	li $v0, 1
	jr $ra
