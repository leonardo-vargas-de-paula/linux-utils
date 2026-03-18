#basico sobre processamento de texto
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#arquivo de exemplo
cat > arquivo_exemplo.txt << EOL
Linha 1 com a palavra linux
Linha 2 sem a palavra
Linha 3 com linux novamente
LINHA 4 COM LINUX
EOL

#busca de forma simples
grep 'linux' arquivo_exemplo.txt

#case insensitive
grep -i 'linux' arquivo_exemplo.txt

#contando ocorrencia
grep -c -i 'linux' arquivo_exemplo.txt

#busca com regex
grep -i '^Linha' arquivo_exemplo.txt

#busca elemento no final
grep 'novamente$' arquivo_exemplo.tx #"$" indica o fim da linha

#adiciona contexto
grep -A 1 -B 1 'sem' arquivo_exemplo.txt # A de after, B de before



