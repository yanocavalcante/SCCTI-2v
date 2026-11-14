# SCCTI-2V

- `sensoring.asm` contem o programa principal e monitora as teclas `1` e `2`. A tecla `1` representa o sensor de carros na Via Secundária e a tecla `2` representa o botão de pedestres para travessia sobre a Via Principal.
- `trafficlights.asm` contem apenas as rotinas que controlam o mostrador da esquerda, para representar os semáforos de ambas as vias.
- Ao iniciar, o *display* esquerdo acende somente os quatro segmentos verticais, indicando sinal verde na Via Principal. Quando um dos sensores recebe algum sinal, todos os sete segmentos desse *display* acendem, representando o sinal vermelho para ambas as vias.

## Execução

O projeto foi modelado em componentes, em mais de um arquivo, por isso, para executá-lo é preciso ativar a opção **Settings > Assemble all files in directory** no MARS e realizar, primeiro, a montagem de `sensoring.asm`. Em seguida, abrir a ferramenta **Tools > Digital Lab Sim**, e clicar em **Connect to MIPS** para executar o programa e interagir com o teclado e o mostrador do **DLS**.
