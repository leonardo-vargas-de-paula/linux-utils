#lista de comandos uteis para analisar o /proc
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#infos sobre a CPU
cat /proc/cpuinfo

# infos sobre a memoria
cat /proc/meminfo

# infos sobre as particoes montadas
cat /proc/mounts

#infos sobre processo atual
ls -l /proc/$$/
cat /proc/$$/status