#lista de comandos uteis para shell script - funcoes e manipulacao de arquivos
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

nano funcoes_arquivos.sh

#!/bin/bash

# Função para exibir uma linha de separação
linha_separadora() {
  local caractere=${1:-"-"}  # Parâmetro com valor padrão
  local tamanho=${2:-50}     # Segundo parâmetro com valor padrão
  
  # Repete o caractere pelo tamanho especificado
  printf "%${tamanho}s\n" | tr " " "$caractere"
}

# Função para verificar se um arquivo existe
verificar_arquivo() {
  local arquivo="$1"
  
  if [ -f "$arquivo" ]; then
    echo "O arquivo '$arquivo' existe."
    return 0  # Sucesso
  else
    echo "O arquivo '$arquivo' não existe."
    return 1  # Falha
  fi
}

# Função para obter informações sobre um arquivo
info_arquivo() {
  local arquivo="$1"
  
  # Verifica se o arquivo existe usando a função anterior
  if ! verificar_arquivo "$arquivo"; then
    return 1
  fi
  
  linha_separadora "=" 60
  echo "Informações do arquivo: $arquivo"
  linha_separadora "-" 60
  
  echo "Tamanho: $(du -h "$arquivo" | cut -f1)"
  echo "Permissões: $(ls -l "$arquivo" | awk '{print $1}')"
  echo "Proprietário: $(ls -l "$arquivo" | awk '{print $3}')"
  echo "Última modificação: $(date -r "$arquivo")"
  
  # Detecta o tipo de arquivo
  if file "$arquivo" | grep -q "text"; then
    echo "Tipo: Arquivo de texto"
    echo "Número de linhas: $(wc -l < "$arquivo")"
  else
    echo "Tipo: Arquivo binário ou não-texto"
  fi
  
  linha_separadora "=" 60
}

# Função para criar um arquivo de texto
criar_arquivo_texto() {
  local arquivo="$1"
  local linhas=${2:-5}  # Número de linhas (padrão: 5)
  
  echo "Criando arquivo '$arquivo' com $linhas linhas..."
  
  # Cria o arquivo com o número especificado de linhas
  for ((i=1; i<=linhas; i++)); do
    echo "Esta é a linha $i do arquivo gerado automaticamente." >> "$arquivo"
  done
  
  echo "Arquivo criado com sucesso!"
  
  # Exibe informações sobre o arquivo criado
  info_arquivo "$arquivo"
}

# Programa principal
linha_separadora "#" 60
echo "           MANIPULAÇÃO DE ARQUIVOS EM BASH            "
linha_separadora "#" 60

# Verifica se foi fornecido um nome de arquivo
if [ $# -eq 0 ]; then
  echo "Uso: $0 <nome_arquivo> [número_de_linhas]"
  exit 1
fi

arquivo="$1"
linhas=${2:-10}  # Usa 10 como padrão se não for fornecido

# Verifica se o arquivo já existe
if [ -f "$arquivo" ]; then
  echo "O arquivo '$arquivo' já existe."
  echo "O que deseja fazer?"
  echo "1. Sobrescrever"
  echo "2. Mostrar informações"
  echo "3. Sair"
  
  read -p "Escolha uma opção (1-3): " opcao
  
  case $opcao in
    1)
      criar_arquivo_texto "$arquivo" "$linhas"
      ;;
    2)
      info_arquivo "$arquivo"
      ;;
    3)
      echo "Operação cancelada."
      exit 0
      ;;
    *)
      echo "Opção inválida!"
      exit 1
      ;;
  esac
else
  criar_arquivo_texto "$arquivo" "$linhas"
fi
