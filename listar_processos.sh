#lista de comandos uteis para gerenciar processos
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#listagem estatica basica
ps

#listagem completa
ps aux

# visualizaçao com hierarquia 
ps auxf

#exemplo de visualizaçao de infos especificas
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu

# listagem dinamica
top

# top nao iterativo

top -bn1 | head -n 15

# existem outras ferramentas como
# htop
# atop
# glances

# Este comando executa top em modo batch (-b) por apenas uma iteração (-n1) 
# e mostra as primeiras 15 linhas.

