#!/bin/bash
#
#Verificação do status de serviço do apache com httpd para o diretorio montagem/nfs/DouglasHenrique



HORA_ATUAL=$(date +%H:%M:%S)
DATA_ATUAL=$(date +%d/%m/%Y)
SERVICO="apache_httpd"
STATUS=$(systemctl is-active $SERVICO)


if [ $STATUS == "active" ]; then
	MENSAGEM="$SERVICO online"
	echo "$HORA $DATA - active - $MENSAGEM" >> /montagem/nfs/DouglasHenrique/validacaoOnline.txt
else
	MENSAGEM="$SERVICO offline"
	echo "$HORA $DATA - $SERVICO - inactive - $MENSAGEM" >> /montagem/nfs/DouglasHenrique/validacaoOffline.txt
fi
