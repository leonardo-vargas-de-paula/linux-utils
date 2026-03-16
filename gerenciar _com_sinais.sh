#lista de comandos uteis para gerenciar processos com sinais
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#listando sinais
kill -l

# sinais

# SIGHUP (1): Hang up, tradicionalmente usado para recarregar configurações

# SIGINT (2): Interrupt, enviado quando você pressiona Ctrl+C

# SIGQUIT (3): Quit, enviado quando você pressiona Ctrl+"

# SIGKILL (9): Kill, força o término imediato (não pode ser capturado ou ignorado)

# SIGTERM (15): Terminate, solicita término gracioso (padrão do comando kill)

# SIGSTOP (19): Stop, pausa a execução (não pode ser capturado)

# SIGCONT (18): Continue, retoma a execução após um SIGSTOP

#uso do kill
#exemplo 1 (processo sleep)
sleep 600 &
PID_SLEEP=$(pgrep sleep | head -n 1)
echo "Enviando sinal para o processo sleep (PID: $PID_SLEEP)"
kill $PID_SLEEP
sleep 1; pgrep -f "^sleep" | grep -q $PID_SLEEP || echo 'Processo terminado'

#exemplo 2 (processo sleep)

sleep 300 &
PID_SLEEP=$(pgrep sleep | head -n 1)
kill -STOP $PID_SLEEP
ps -p $PID_SLEEP -o pid,state,cmd #se usou o sleep 600 & antes ele nao aparece o sleep 300
                                  #verifique com ps -o pid,state,cmd
#exemplo 2 (processo sleep)
sleep 345 &
PID_SLEEP=$(pgrep -f "sleep 345" | head -n 1)
kill -9 $PID_SLEEP
sleep 0.5; ps -p $PID_SLEEP &>/dev/null || echo 'Processo eliminado com SIGKILL'

#killal - mata processos por nome
#exemplo 1 (processo sleep)
sleep 200 & sleep 250 & sleep 300 &
killall sleep
pgrep sleep || echo 'Todos os processos sleep foram encerrados'
#pode ser que tenha algum sleep ainda, rode ps -fp <PID>

#pkill - mata processos por nome ou PID, é mais flexivel
sleep 100 & sleep 200 & sleep 300 &
pkill -f 'sleep 2' #mata o processo sleep 200, mas nao o resto
pgrep -fa sleep
pkill sleep

