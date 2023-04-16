#!/bin/bash

echo "Apagar usuarios antigos"
userdel -f carlos
userdel -f maria
userdel -f joao

userdel -f debora
userdel -f sebastiana
userdel -f roberto

userdel -f josefina
userdel -f amanda
userdel -f rogerio

echo "Apagar estrutura diretorio antiga"
rm -r -f /Projeto /home/carlos /home/maria /home/joao /home/debora /home/sebastiana /home/roberto /home/josefina /home/amanda /home/rogerio

echo "Criar grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criar usuarios"
useradd -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -1 Senha123) -c "Carlos ADM" carlos
useradd -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -1 Senha123) -c "Maria ADM" maria
useradd -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -1 Senha123) -c "Joao ADM" joao

useradd -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -1 Senha123) -c "Debora VEN" debora
useradd -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -1 Senha123) -c "Sebstiana VEN" sebastiana
useradd -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -1 Senha123) -c "Roberto VEN" roberto

useradd -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -1 Senha123) -c "Joefina SEC" josefina
useradd -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -1 Senha123) -c "Amanda SEC" amanda
useradd -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -1 Senha123) -c "Rogerio SEC" rogerio

echo "Modificar expiracao do usuario"
passwd carlos -e
passwd maria -e
passwd joao -e

passwd debora -e
passwd sebastiana -e
passwd roberto -e

passwd josefina -e
passwd amanda -e
passwd rogerio -e

echo "Criar diretorios"
mkdir /Projeto
mkdir /Projeto/publico /Projeto/adm /Projeto/ven /Projeto/sec

echo "Conceder permissoes aos diretorios"
chmod 777 /Projeto
chmod 777 /Projeto/publico

chmod 770 /Projeto/adm
chmod 770 /Projeto/ven
chmod 770 /Projeto/sec

echo "Mudar Owner dos diretorios"
chown root:GRP_ADM /Projeto/adm
chown root:GRP_VEN /Projeto/ven
chown root:GRP_SEC /Projeto/sec

echo "FIM"
