.text

main:
	jal InitializeTrafficLights
	move $s0, $zero                # Trava: evita repetir o sinal durante a mesma pressao.
	
	jal InitializeTimerDisplay
	
	jal MonitorSensors

stoplight_cycle:
	jal PYel_SRed # Vai "pedir" 2 segundos ao temporizador	
	jal InitializeTimerDisplay
	jal TimerCheck
	
	jal BothRed # Vai "pedir" 1 segundo ao temporizador
	jal InitializeTimerDisplay
	jal TimerCheck	
	
	jal PRed_SGreen # Vai "pedir" 5 segundos ao temporizador
	jal InitializeTimerDisplay	
	jal TimerCheck
	
	jal PRed_SYel # Vai "pedir" 2 segundos ao temporizador
	jal InitializeTimerDisplay	
	jal TimerCheck
	
	jal BothRed # Vai "pedir" 1 segundo ao temporizador
	jal InitializeTimerDisplay	
	jal TimerCheck	

	j main

exit:
	li $v0, 10
	syscall
