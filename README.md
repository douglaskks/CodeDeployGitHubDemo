Os serviços da aws foram configuradas corretamente, onde foi criada a instância com o SO Linux 2 com a configuração (Família t3.small) com 16GB de armazenamento em um SSD, após a criação da instância com o par de chaves já gerada foi feito o passo do elastic ip e foi colocado na instãncia para que o ip público não se modifique, logo após foi a vez das portas TCP e UDp serem abertas para ser permitido o acesso SSH nas portas 22/SSH, 111/TCP e UDP, porta 2049 TCP e UDP também, porta 80/TCP e porta 443 para TCp, após isso o acesso foi feito concluido com sucesso.

Seguindo os sequintes requisitos para o linux

  <h3>Configurar o NFS entregue</h3>
  
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
      
   <h3>Criar Scripts que validem se o serviço está online ou não</h3>
      <h4> Primeiro script executável <h4>
        <code> 
  
