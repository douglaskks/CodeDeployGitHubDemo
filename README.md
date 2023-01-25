Os serviços da aws foram configuradas corretamente, onde foi criada a instância com o SO Linux 2 com a configuração (Família t3.small) com 16GB de armazenamento em um SSD, após a criação da instância com o par de chaves já gerada foi feito o passo do elastic ip e foi colocado na instãncia para que o ip público não se modifique, logo após foi a vez das portas TCP e UDp serem abertas para ser permitido o acesso SSH nas portas 22/SSH, 111/TCP e UDP, porta 2049 TCP e UDP também, porta 80/TCP e porta 443 para TCp, após isso o acesso foi feito concluido com sucesso.

No Linux inicialmente foi feito a intalação do nfs-kernel-server para fazer tranferência de arquivos para outras máquinas clientes, foi feito a instalação através do "yum install nfs-utils" mas muitos packages já vem instalados no Linux do ec2 o nfs foi ativado através do "systemctl enable nfs-derver", após isso já foi deixado o efs pronto para o uso, mas por fim o arquivo de configuração está localizado em "/etc/exports".



