#!/bin/bash
#Author: Javier Fernández Febrero


##Variables


## Axuda                                                                       #
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-g|h|t|v|V]"
   echo "options:"
   echo
}



## Script                                                              #
# Opcions
while getopts ":h" option; do
   case $option in
      h) #
         Help
         exit;;
     \?) #
         echo "Error"
         exit;;
   esac
done

# arrancamos todo

echo " ${GREEN} Arrancamos todo.... ${END}"
echo " ${GREEN} Creando carpeta personal $USER ${END}"
echo " ${GREEN} Esto levara un momento ${END}"
cd $HOME
mkdir .$USER
cd .$USER
mkdir Proxectos
mkdir scripts
mkdir senhas
mkdir ficheiros
echo " ${GREEN} Creada a estructura das carpetas $USER ${END}"
cd $HOME/.$USER/scripts
git clone https://github.com/fdezfebrero/scripts.git
echo " ${GREEN} Cargados os scripts ${END}"
export PATH="$PATH:$HOME/.$USER/scripts/scripts"
cp senha $HOME/.$USER/senhas
echo " ${GREEN} Añadido ficheiro de contrasinales ${END}"
echo " ${GREEN} Configurando Shell Zsh e temas ${END}"
if [ $(uname) = $LINUX ];then
  if [ -d ~/.zshrc ];then
    sudo apt install git curl -y
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
      sudo apt update && sudo apt install zsh
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi
if [ $(uname) = $DARWIN ];then
  if [ -d ~/.zshrc ];then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
      brew install zsh
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  fi
fi
echo " ${GREEN} Configurado o PATH e os Alias ${END}"
cd $HOME
if [ -f $HOME/.zshrc ];then
  cd $HOME
  echo " ">>.zshrc
  echo "# Añadimos Scripts o Path">>.zshrc
  echo "export PATH="$PATH:/Users/febrero/.febrero/scripts/scripts"">>.zshrc
elif [[ -f $HOME/.bshrc ]]; then
  cd $HOME
  echo " ">>.bashrc
  echo "# Añadimos Scripts o Path">>.bashrc
  echo "export PATH="$PATH:/Users/febrero/.febrero/scripts/scripts"">>.bshrc
else
  echo "Nin bash ni zsh, que merda tes?"

fi
if [ -f $HOME/.zshrc ];then
  if grep -E DIRJ .zshrc;then
    echo "xa existe o alias"
  else
    echo " ">>.zshrc
    echo "# Alias Propios">>.zshrc
    echo "alias DIRJ=$HOME/.$USER">>.zshrc
  fi
elif [[ -f $HOME/.bshrc ]]; then
  if grep -E DIRJ .bashrc;then
    echo "xa existe o alias"
  else
    echo " ">>.bashrc
    echo "# Alias Propios">>.bashrc
    echo "alias DIRJ=$HOME/.$USER">>.bashrc
  fi
else
  echo "Nin bash ni zsh, que merda tes?"

fi

