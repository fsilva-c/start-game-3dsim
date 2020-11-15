####### Ajuste dos diretórios #######
#   Atenção!!!! 

# O comando sed -i possui a seguinte esrutura:
# sed -i 's+STRING_A_SER_MODIFICADA+NOVA_STRING+g' arquivo.txt arquivo2.yml

#ROBOVIZ_DIR
sed -i 's+ROBOVIZ_DIR=/home/qwerty/roboviz/+ROBOVIZ_DIR=+g' game.yml

#PROXY_DIR
sed -i 's+PROXY_DIR=/home/qwerty/magmaProxy/+PROXY_DIR=+g' game.yml

#BRT_BIN_DIR
sed -i 's+BRT_BIN_DIR=/home/qwerty/3D/bahiart/+BRT_BIN_DIR=+g' game.yml

#####################################
