#básico sobre awk
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#arquivo de exemplo
cat > arquivo_colunas.txt << EOL
col1 col2 col3
val1 val2 val3
xyz abc 123
EOL

#registro completo = $0
#demais $1 ...

#imprime primeiro registro
awk '{print $1}' arquivo_colunas.txt

#formataçao customizada e mais de um registro
awk '{print "Coluna 1: " $1, "Coluna 3: " $3}' arquivo_colunas.txt

#retornando o ultimo campo
awk '{print $NF}' arquivo_colunas.txt

#condicional
awk '$3 == "val3" {print $0}' arquivo_colunas.txt

#exemplo com separador diferente
cat > arquivo_csv.txt << EOL
Nome,Idade,Cidade
João,35,São Paulo
Maria,28,Rio de Janeiro
Pedro,42,Belo Horizonte
EOL

#usando , como separador

awk -F, '{print "Nome: " $1, "Idade: " $2}' arquivo_csv.txt

#suporta exepressoes matematicas
#exemplo com calculo de media

#NR>1 pula o cabeçalho

awk -F, 'NR>1 {sum+=$2; count++} END {print "Média de idade: " sum/count}' arquivo_csv.txt
