#!/bin/bash

###
### SIGpi
###
### installer_gnuradio38
###

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Install GNUradio 3.8    (ETA: +60 Minutes)"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"

cd $SIGPI_SOURCE
git clone https://github.com/gnuradio/gnuradio.git
cd gnuradio
git checkout maint-3.8
git submodule update --init --recursive
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make -j4
sudo make install
sudo ldconfig
cd ~
echo "export PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python3.6/dist-packages:$PYTHONPATH" >> .profile
echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> .profile

# Copy Menu items into relevant directories
sudo cp $SIGPI_SOURCE/gnuradio/grc/scripts/gnuradio-grc.desktop $DESKTOP_FILES
	
# Add SigPi Category for each installed application
sudo sed -i "s/Categories.*/Categories=$SIGPI_MENU_CATEGORY;/" $DESKTOP_FILES/gnuradio-grc.desktop

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Installation Complete !!"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"