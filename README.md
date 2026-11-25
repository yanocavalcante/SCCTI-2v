# SCCTI-2V

Simulação, em MIPS/MARS, de um cruzamento com uma via principal, uma via secundária e solicitações de travessia. A interface é a ferramenta **Digital Lab Sim** do MARS: o mostrador esquerdo representa o estado dos semáforos e o direito mostra os segundos decorridos na fase atual.

## Funcionamento

O sistema começa com a Via Principal verde e a Via Secundária vermelha. Ele aguarda a tecla `1` ou `2` e, quando detecta uma solicitação, executa o ciclo abaixo antes de voltar ao estado inicial:

| Estado | Duração |
| --- | ---: |
| Via Principal amarela / Via Secundária vermelha | 2 s |
| Ambas vermelhas | 1 s |
| Via Principal vermelha / Via Secundária verde | 5 s |
| Via Principal vermelha / Via Secundária amarela | 2 s |
| Ambas vermelhas | 1 s |

O mostrador da direita é reiniciado para `0` no início de cada fase e atualizado a cada segundo. O temporizador usa a `syscall` 30 do MARS (tempo em milissegundos - *epoch*) e mantém marcos de 1000 ms.

## Entradas e saídas

- Tecla `1`: sensor de veículos na Via Secundária.
- Tecla `2`: botão de solicitação de travessia de pedestres sobre a Via Principal.
- Display esquerdo (`0xFFFF0011`): semáforos.
- Display direito (`0xFFFF0010`): contador de segundos.

Os dois sensores têm o mesmo efeito no fluxo atual: iniciam o próximo ciclo de semáforos. A leitura ocorre enquanto o sistema está no estado inicial de Via Principal verde / Via Secundária vermelha.

## Organização

- `main.asm`: fluxo principal e sequência de estados.
- `sensoring.asm`: leitura do teclado do Digital Lab Sim.
- `trafficlights.asm`: padrões de segmentos e duração de cada estado dos semáforos.
- `timer.asm`: contagem dos segundos de cada fase.
- `timerDSL.asm`: conversão de dígitos e escrita no display direito.

## Execução no MARS

1. Abra `main.asm` no MARS.
2. Ative **Settings > Assemble all files in directory** para montar os módulos juntos.
3. Mantenha **Settings > Delayed Branching** desativado.
4. Monte o programa e abra **Tools > Digital Lab Sim**.
5. Clique em **Reset** no Digital Lab Sim, depois em **Connect to MIPS**.
6. Execute o programa e pressione `1` ou `2` no teclado da ferramenta para iniciar um ciclo.
