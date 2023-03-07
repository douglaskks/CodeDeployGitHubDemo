Os serviços da aws foram configuradas corretamente, onde foi criada a instância com o SO Linux 2 com a configuração (Família t3.small) com 16GB de armazenamento em um SSD, após a criação da instância com o par de chaves já gerada foi feito o passo do elastic ip e foi colocado na instãncia para que o ip público não se modifique, logo após foi a vez das portas TCP e UDp serem abertas para ser permitido o acesso SSH nas portas 22/SSH, 111/TCP e UDP, porta 2049 TCP e UDP também, porta 80/TCP e porta 443 para TCp, após isso o acesso foi feito concluido com sucesso.

Seguindo os sequintes requisitos para o linux

  
  <h5> Onde foi criado um diretório para que os arquivos possam ser armazenados na pasta através do<br>
       usuário root com os comandos:<h5>
    
  <i>mkdir /montagem/nfs</i>
            
  <h5>Para montar<h5>
    <i>mount <b>ip_ou_dns_do_nfs</b>:/ /montagem/nfs</i>
  
  <h5>para verificar se funcionou<h5>
    <i>df -h</i>

  <h5>A dicionar a seguinte opção para iniciar o nfs no boot<h5><br>
    <i>Vá em <b>/etc/fstab<b></i><br>
    <i><b>ip_ou_dns_do_nfs</b>:/ /mnt/nfs nfs defaults 0 0</i><br>
    <i>:wq</i> para salvar<br>
    <i> Criar um novo diretório com seu nome (DouglasHenrique) no caminho /montagem/nfs/Nome_participante</i><br>
      
   <h3>Configurar o Apache2 no servidor</h3>
      <i> Sequência: </i><br>
      <i>yum update -y</i><br>
      <i>yum install httpd</i> e confirma<br>
      <i>systemctl start httpd</i><br>
      <i>systemctl enable httpd</i><br>
      <i>systemctl status httpd</i><br>
      
Criar Scripts que validem se o serviço está online ou não
Primeiro script executável:


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
                        
                        
<h3> Irá mostrar as informações atuais do seervidor Hora atual, Data atual e seu status, caso estiver online exibirá a mensagem<br>
     <i>"apache_httpd online"</i> caso offline <i>"apache_httpd offline"</i> 
  
  
 <h2> Referências: <h2> 
 <h4> Amazon Web Services <h4>
 https://docs.aws.amazon.com/pt_br/index.html
   
 <h4> Apache2 <h4>
 https://httpd.apache.org/docs/trunk/pt-br/
   
 <h4> NFS Debian <h4>
 https://debian-handbook.info/browse/pt-BR/stable/sect.nfs-file-server.html
