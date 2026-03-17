#lista de comandos uteis para gerenciar usuarios
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#arquivos principais
# /etc/passwd: Armazena informações básicas dos usuários
    
# /etc/shadow: Armazena senhas criptografadas dos usuários

# /etc/group: Armazena informações sobre grupos

# /etc/gshadow: Armazena informações sensíveis sobre grupos

# /etc/login.defs: Define políticas de senhas e configurações de contas

# /etc/skel/: Diretório contendo arquivos que são copiados para o diretório home de novos usuários


# --> passwd

cat /etc/passwd | head -5

nome_usuário:senha:UID:GID:comentário:diretório_home:shell #formato da resposta


# nome_usuário: Nome da conta do usuário

# senha: Historicamente continha a senha criptografada, agora contém 'x' indicando que a senha está em /etc/shadow

# UID: User ID, identificador numérico único do usuário (0 para root, 1-999 geralmente para usuários de sistema, 1000+ para usuários regulares)

# GID: Group ID, identificador numérico do grupo principal do usuário

# comentário: Informações descritivas sobre o usuário (nome completo, departamento, etc.)

# diretório_home: Diretório inicial do usuário

# shell: Shell padrão do usuário

#retornando infos de usuarios especificos

grep root /etc/passwd
grep ^daemon /etc/passwd

#infos usuario atual
id 

