#!/bin/bash

###
### SIGpi
###
### installer_fldigi
###

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Install Fldigi Suite"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"

# Install FLxmlrpc
wget http://www.w1hkj.com/files/flxmlrpc/flxmlrpc-0.1.4.tar.gz -P $HOME/Downloads
tar -zxvf $HOME/Downloads/flxmlrpc-0.1.4.tar.gz -C $SIGPI_SOURCE
cd $SIGPI_SOURCE/flxmlrpc-0.1.4
./configure --prefix=/usr/local --enable-static
make
sudo make install
sudo ldconfig
	
# Install FLrig
wget http://www.w1hkj.com/files/flrig/flrig-1.4.2.tar.gz -P $HOME/Downloads
tar -zxvf $HOME/Downloads/flrig-1.4.2.tar.gz -C $SIGPI_SOURCE
cd $SIGPI_SOURCE/flrig-1.4.2
./configure --prefix=/usr/local --enable-static
make
sudo make install
sudo ldconfig
sudo cp $SIGPI_SOURCE/flrig-1.4.2/data/flrig.desktop $SIGPI_DESKTOP

#Install Fldigi
wget http://www.w1hkj.com/files/fldigi/fldigi-4.1.20.tar.gz -P $HOME/Downloads
tar -zxvf $HOME/Downloads/fldigi-4.1.20.tar.gz -C $SIGPI_SOURCE
cd $SIGPI_SOURCE/fldigi-4.1.20
./configure --prefix=/usr/local --enable-static
make
sudo make install
sudo ldconfig
sudo cp $SIGPI_SOURCE/fldigi-4.1.20/data/fldigi.desktop $SIGPI_DESKTOP
sudo cp $SIGPI_SOURCE/fldigi-4.1.20/data/flarq.desktop $SIGPI_DESKTOP

# Copy Menu items into relevant directories
#sudo cp $SIGPI_SOURCE/themes/desktop/xastir.desktop $DESKTOP_FILES
	
# Add SigPi Category for each installed application
#sudo sed -i "s/Categories.*/Categories=$SIGPI_MENU_CATEGORY;/" $DESKTOP_FILES/xastir.desktop

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Installation Complete !!"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"