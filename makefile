all: update

update:
	sudo apt-get -y update


vim:
	sudo apt-get install -y vim-nox-py2 powerline
	git clone http://github.com/powerline/fonts.git
	fonts/install.sh
	mkdir -p ~/Dropbox/v/vim-notes
	chgrp -R cgis ~/Dropbox/v/vim-notes
	chown -R cgis ~/Dropbox/v/vim-notes
	git clone https://github.com/sjsrey/vimfiles.git ~/.vim
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	chgrp -R cgis .vim
	chown -R cgis .vim
	ln -s ~/.vim/vimrc ~/.vimrc
	chgrp -R cgis ~/.vimrc
	chown -R cgis ~/.vimrc
	vim +PluginInstall +qall

anaconda:
	wget https://repo.continuum.io/archive/Anaconda3-4.1.1-Linux-x86_64.sh
	bash Anaconda3-4.1.1-Linux-x86_64.sh

zsh:
	sudo apt-get install -y zsh
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"


qgis:
	sudo add-apt-repository 'deb http://qgis.org/debian xenial main'
	sudo sh -c "echo deb-src http://qgis.org/debian xenial main \ >> /etc/apt/sources.list"
	wget -O - http://qgis.org/downloads/qgis-2016.gpg.key | gpg --import
	sudo apt-get update
	sudo apt-get install qgis python-qgis qgis-plugin-grass
	sudo apt-get install -y python-scipy


clean:
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	rm -rf ~/fonts
	rm -rf ~/Dropbox/v/vim-notes
