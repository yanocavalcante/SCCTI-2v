.text

main:
	jal InitializeTrafficLights
	move $s0, $zero                # Trava: evita repetir o sinal durante a mesma pressao.
	
	jal MonitorSensors
	
	jal BothRed
	jal TimerCheck

exit:
	li $v0, 10
	syscall

## TODO
stoplight_cycle:
	jal PYel_SRed # Vai "pedir" 2 segundos ao temporizador	
	jal TimerCheck
	
	jal BothRed # Vai "pedir" 1 segundo ao temporizador	
	jal TimerCheck	
	
	jal PRed_SGreen # Vai "pedir" 5 segundos ao temporizador	
	jal TimerCheck
	
	jal PRed_SYel # Vai "pedir" 2 segundos ao temporizador	
	jal TimerCheck
	
	jal BothRed # Vai "pedir" 1 segundo ao temporizador	
	jal TimerCheck	

	jal PGreen_SRed # Representa o estado "Idle" ou Estado Inicial do programa
