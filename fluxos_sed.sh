#Editando Fluxos com sed
#nao rodar esse script, ele tem apenas a funcao de mostrar os comandos
# Fonte: cursos do Girus da LinuxTips

#usando exemplo 
cat > arquivo_exemplo.txt << EOL
Linha 1 com a palavra linux linuX
Linha 2 sem a palavra
Linha 3 com linux novamente
LINHA 4 COM LINUX
EOL

#retorna a substituicao da primeira ocorrencia de linux
#em cada linha por GIRUS
sed 's/linux/GIRUS/' arquivo_exemplo.txt

#substituir todas as ocorrencias e case insensitve
sed 's/linux/GIRUS/gi' arquivo_exemplo.txt

#aplica para a linha especifica do padrao de busca
sed '/sem/d' arquivo_exemplo.txt

#pode se usar a flag -i para fazer a alteração
sed -i '/sem/d' arquivo_exemplo.txt

#substituir apenas na primeira linha
sed '1 s/linux/GIRUS/' arquivo_exemplo.txt

#substituir na primeira linha ate a X
sed '1,X s/linux/GIRUS/' arquivo_exemplo.txt