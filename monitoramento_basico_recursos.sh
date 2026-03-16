#lista de comandos uteis para monitorar recursos
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#visualizar uso de memoria
free -h

# visualizar estatisticas a cada segundo
vmstat 1 2 #roda 2 vezes a cada 1 segundo

#analisando atividade d disco
# se necessario: sudo apt-get update && sudo apt-get install -y sysstat 

#estatisticas de IO para todos dispositivos (-x) a cada 1 segundo por 2 vezes
iostat -x 1 2


