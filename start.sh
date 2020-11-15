#!/bin/bash

MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`
cd $MY_PATH

#tempos
if [[ $2 == "--1" ]]  ; then
    sed -i 's/TIME_1=30/TIME_1=15/g' game.yml
    sed -i 's/TIME_2=15/TIME_2=30/g' game.yml
    
elif [[ $2 == "--2" ]]  ; then
    sed -i 's/TIME_1=15/TIME_1=30/g' game.yml
    sed -i 's/TIME_2=30/TIME_2=15/g' game.yml
fi

BINS_DIR=( "export VSTEAM_BIN_DIR=/home/qwerty/3D/binarios_times/WrightOcean/;" 
           "export VSTEAM_BIN_DIR=/home/qwerty/3D/binarios_times/FCP2020/fcpbin/;" 
           "export VSTEAM_BIN_DIR=/home/qwerty/3D/binarios_times/AIUT3D-2020/AIUT3D/;" 
           "export VSTEAM_BIN_DIR=/home/qwerty/3D/binarios_times/HFUTEngine2020/;" 
           "export VSTEAM_BIN_DIR=/home/qwerty/3D/binarios_times/magmaagent/;" 
           "export VSTEAM_BIN_DIR=/home/qwerty/3D/binarios_times/utaustinvilla/;" 
)

# link the session file to .tmuxinator.yml
if [[ $1 == "--wright" ]]  ; then
    VSTEAM_BIN_DIR=${BINS_DIR[0]}

elif [[ $1 == "--fcp" ]]  ; then
    VSTEAM_BIN_DIR=${BINS_DIR[1]}

elif [[ $1 == "--aiut3d" ]]  ; then
    VSTEAM_BIN_DIR=${BINS_DIR[2]}

elif [[ $1 == "--hfut" ]]  ; then
    VSTEAM_BIN_DIR=${BINS_DIR[3]}

elif [[ $1 == "--magma" ]]  ; then
    VSTEAM_BIN_DIR=${BINS_DIR[4]}

elif [[ $1 == "--austin" ]]  ; then
    VSTEAM_BIN_DIR=${BINS_DIR[5]}

else
    echo "WITHOUT FLAG"
    exit
fi

# editando o arquivo .yml para o diretório correspondente ao time adversário passado via flag
for (( i=0; i<${#BINS_DIR[@]}; i++ ))  ;
do
    sed -i "s|${BINS_DIR[i]}|${VSTEAM_BIN_DIR}|g" game.yml
done

# link
rm .tmuxinator.yml
ln game.yml .tmuxinator.yml

tmuxinator
