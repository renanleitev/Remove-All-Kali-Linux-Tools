#!/bin/bash
# Definindo a senha sudo (modificar se não for 'kali')
PASSWORD='kali';
# Mudando o teclado para pt-br
echo -e $PASSWORD | sudo -S sed -i 's/us/br/' /etc/default/keyboard; 
# Atualizando o sistema
echo -e $PASSWORD | sudo -S apt update;
# Instalando o snap
echo -e $PASSWORD | sudo -S apt install snapd -y;
# Configurando o snap para iniciar junto com o sistema
echo -e $PASSWORD | sudo -S systemctl enable snapd;
echo -e $PASSWORD | sudo -S systemctl start snapd;
echo -e $PASSWORD | sudo -S systemctl enable apparmor;
echo -e $PASSWORD | sudo -S systemctl start apparmor;
# Configurando o snap, para funcionar com o sudo
echo -e $PASSWORD | sudo -S sed -i 's/\/bin\"/\/bin\:\/snap\/bin\"/' /etc/sudoers;
# Adicionando o caminho dos snaps junto ao sistema
echo 'export PATH=$PATH:/snap/bin' >> .zshrc;
# Instalando aplicativos. Se não quiser instalar algum, usar # no começo da frase
# Instalando o docker
echo -e $PASSWORD | sudo -S snap install docker;
# Instalando o mysql-workbench-community
echo -e $PASSWORD | sudo -S snap install mysql-workbench-community;
# Instalando o vs code 
echo -e $PASSWORD | sudo -S snap install code --classic;
# Instalando o java
echo -e $PASSWORD | sudo -S snap install openjdk;
# Instalando o eclipse (ide para java)
echo -e $PASSWORD | sudo -S snap install eclipse --classic;
# Instalando o intellij (ide para java)
echo -e $PASSWORD | sudo -S snap install intellij-idea-community --classic;
# Instalando o pycharm (ide para python)
echo -e $PASSWORD | sudo -S snap install pycharm-community --classic;
# Instalando o node
echo -e $PASSWORD | sudo -S snap install node --classic;
# Instalando o chromium (versão open-source do chrome)
echo -e $PASSWORD | sudo -S snap install chromium;
# Instalando o htop (gerenciador de tarefas)
echo -e $PASSWORD | sudo -S snap install htop;
# Instalando o neofetch (para visualizar informações do sistema)
echo -e $PASSWORD | sudo -S snap install neofetch-desktop;
# Instalando a snap store (onde você pode baixar outros aplicativos)
echo -e $PASSWORD | sudo -S snap install snap-store;
# Gerando atalhos na área de trabalho
cp /var/lib/snapd/desktop/applications/* ~/Desktop;
# Encerrando o script
echo 'Fim do script. Reiniciando o sistema...';
# Reiniciando o sistema
echo -e $PASSWORD | sudo -S reboot;

