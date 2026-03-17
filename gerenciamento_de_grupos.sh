#lista de comandos uteis para gerenciar grupos
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#ver informações de grupos
cat /etc/group | head -10
nome_grupo:senha:GID:membros

#ver grupos que o usuario pertence
groups
groups testeuser

#criar crubos
groupadd
sudo groupadd projeto

#adicionando usuario a um grupo
sudo usermod -aG projeto testuser
sudo gpasswd -a testuser projeto
sudo useradd -G projeto colaborador

#removendo usuario de grupo
sudo gpasswd -d testuser projeto
sudo deluser testuser projeto

#alterando grupo primario
sudo usermod -g projeto testuser

#deletando grupo
sudo groupdel projeto

#listando usuarios de um grupo
getent group projeto
grep projeto /etc/group

# ------ # EXEMPLO # ------ #  

sudo groupadd

sudo mkdir -p /projetos/web

sudo chgrp projeto_web /projetos/web

sudo chmod 2775 /projetos/web

sudo usermod -aG projeto_web testuser
sudo usermod -aG projeto_web testuser2

# ------ # EXEMPLO 2 # ------ # 

sudo useradd -r -s /sbin/nologin -c "Usuário do servidor web" webserver #usuario de sistema
sudo mkdir -p /var/www/html
sudo chown webserver:webserver /var/www/html

# ------ # BOAS PRATICAS # ------ #


# Política de Privilégio Mínimo: Conceda apenas os privilégios necessários para cada usuário ou grupo.
# Use sudo em vez de root direto: Configure sudo para permitir ações administrativas controladas.
# Revise Regularmente: Audite as contas de usuários e grupos para remover contas inativas ou desnecessárias.
# Implemente Expiração: Configure expiração de senhas para forçar atualizações regulares.
# Monitoramento: Mantenha logs de autenticação e configure alertas para falhas de login.
# Desativar ao invés de Remover: Para funcionários que saem, bloqueie as contas em vez de excluí-las imediatamente.

# AUTOMATIZAR

# Scripts Shell: Para criação em massa de usuários
# Ansible, Puppet, Chef: Para gerenciamento de configuração
# LDAP ou Active Directory: Para autenticação centralizada
# SSSD, Kerberos, FreeIPA: Para implementações mais complexas


