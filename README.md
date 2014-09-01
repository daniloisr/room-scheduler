# Reserva de Sala

Sistema simples para reserva de sala *uma* sala de reunião.

## Para executar

    $ bundle install
    $ bin/rake db:create db:migrate

    $ bin/rails server
    $ bin/rake # to run tests

## Observações

* O modelo `Schedule` (responsável por um agendamento na sala) possui a data final (`finish`) que é definida como 1 hora a mais. Assim a reserva pode ocorrer em um intervalo. Talvez nem fosse preciso esse atributo, mas ele pode ser útil para uma lógica mais complexa.


## TODO

* Fazer um seed para a semana, ou talvez um link para gerar uns usuários e preencher algumas salas
* Verificar se a reserva do horário já foi feita (por outro usuário em uma outra sessão)
