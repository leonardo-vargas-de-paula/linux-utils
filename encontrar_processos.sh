#lista de comandos uteis para encontrar processos
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

pgrep nome_do_processo

#retorna de acordo com a linha de comando
pgrep -f 'alguma_coisa'

#lista o processo junto com o PID
pgrep -l nome_do_processo

#retorna o comando todo
pgrep -a processo

#filtro por usuário
pgrep -u $(id -u) processo

#inverte
pgrep -v processo

#lista o mais recente
pgrep -n processo

#lista o mais antigo
pgrep -o processo

# alternativa mais direta
pidof processo

#utilizando ps e grep sem aparecer o proprio comando
ps aux | grep '[p]rocesso'


# Filtragem por uso de recurso
ps aux --sort=-%cpu | head -n 5
ps aux --sort=-%mem | head -n 5

#salvar o PID
#EXEMPLO
sleep 300 &
SLEEP_PID=$(pgrep -f 'sleep 300' | head -n 1)
echo "O PID do processo 'sleep 300' é: $SLEEP_PID"
