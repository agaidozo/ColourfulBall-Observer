# ColourfulBall-Observer

Um aplicativo iOS simples que mostra uma bola colorida que se move pela tela.

## Sumário
Este aplicativo usa o padrão Observer para atualizar a posição da bola de acordo com os movimentos do usuário.

## Requisitos de sistema
- iOS 15.0 ou superior
- Xcode 14.0 ou superior

## Como usar
1. Abra o projeto no Xcode.
1. Execute o projeto no simulador ou em um dispositivo físico.

## Explicação
O aplicativo usa um objeto `Ball` para representar a bola. O objeto `Ball` implementa o protocolo `Observer`.

O aplicativo também usa um objeto `ViewController` para representar a tela. O objeto `ViewController` é um `Observer` do objeto `Ball`.

Quando o usuário toca na tela, o objeto `ViewController` envia um evento para o objeto `Ball`. O objeto `Ball` então atualiza sua posição de acordo com o evento.

## Código
O código do aplicativo está localizado no diretório Sources.

## Mais informações
Padrão Observer: https://en.wikipedia.org/wiki/Observer_pattern  
Data de criação: 2023-09-27  
Autor: Obde Willy  

## Conclusão

Este aplicativo é um bom ponto de partida para quem deseja aprender sobre o padrão Observer. Ele mostra como o padrão Observer pode ser usado para atualizar a posição de um objeto de acordo com os eventos de outro objeto.
