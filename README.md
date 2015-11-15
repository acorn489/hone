This file provides an installation guide to both OSX & Ubuntu:

A) OSX
	For installation all actions will be done through the terminal.

	# Installing Homebrew
	1- Run the following command:

		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# Installing Ruby 2.2.3
	2- Run the following commands one by one:

		brew install rbenv ruby-build

	#Add rbenv to bash so that it loads every time you open a terminal:
		echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile

		source ~/.bash_profile

	#Install Ruby:
		rbenv install 2.2.3

		rbenv global 2.2.3

		ruby -v

	# Installing Rails 4.2.4
	3- Run the following commands one by one:

		gem install rails -v 4.2.4

	#To make rails executable:
		rbenv rehash

	4- And now we can verify that Rails 4.2.4 is installed by executing the following command:

		rails -v

	# Installing mysql
	5- Run the following commands one by one:

		brew install mysql

	#To have launchd start mysql at login:
		ln -sfv /usr/local/opt/mysql/*plist ~/Library/LaunchAgents

	#Then to load mysql now:
		launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

	6- By default the mysql user is root with no password. So if you already have a mysql server installed to the machine with different username or with a password, you need to adjust the database.yml file (hone/config/database.yml) before running the application with the right username, password and socket.


	# Running Hone
	7- Also using the terminal cd to the directory you wish to put the application folder in. So if you want to put it on your desktop you would run the following command from the default location of the terminal:

		cd Desktop

	8- Clone the repository by running:

		git clone https://github.com/Husseny/hone.git

	9- Navigate to the project's folder:

		cd hone

	10- Run the following command to install the necessary gems(Check the manual to know what gems are):

		bundle install

	11- Run the following command to setup the database tables(Check the manual to know what database migrations are):

		rake db:migrate

	12- Run the following command to insert records and seeds in the tables:

		rake db:seed

	13- Run the following the command to start the rails server:

		rails s
		or
		rails server

	14- The server should be running at localhost:3000 which is the root of the application.

	15- Visit localhost:3000 from your browser to check the application.

References:
https://gorails.com/setup/osx



B) Ubuntu
	For installation all actions will be done through the terminal.

	# Installing Ruby 2.2.3:
	1- Run the following commands to install some dependencies for Ruby:

		sudo apt-get update

		sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

	2- Install Ruby using rbenv by running the following commands one by one:

		cd

		git clone git://github.com/sstephenson/rbenv.git .rbenv

		echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

		echo 'eval "$(rbenv init -)"' >> ~/.bashrc

		exec $SHELL

		git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

		echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

		exec $SHELL

		git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

		rbenv install 2.2.3

		rbenv global 2.2.3

		ruby -v

		echo "gem: --no-ri --no-rdoc" > ~/.gemrc

		gem install bundler

	# Installing Rails 4.2.4:
	3- Run the following commands one by one:

		sudo add-apt-repository ppa:chris-lea/node.js

		sudo apt-get update

		sudo apt-get install nodejs

		gem install rails -v 4.2.4

	#To make rails executable:
		rbenv rehash

	4- And now we can verify that Rails 4.2.4 is installed by executing the following command:

		rails -v

	# Installing mysql:
	5- Run the following command:

		sudo apt-get install mysql-server mysql-client libmysqlclient-dev

	6- You need to match the database.yml file (hone/config/database.yml) before running the application with the right username, password of your installed mysql server.

	# Running Hone
	7- Also using the terminal cd to the directory you wish to put the application folder in. So if you want to put it on your desktop you would run the following command from the default location of the terminal:

		cd Desktop

	8- Clone the repository by running:

		git clone https://github.com/Husseny/hone.git

	9- Navigate to the project's folder:

		cd hone

	10- Run the following command to install the necessary gems(Check the manual to know what gems are):

		bundle install

	11- Run the following command to setup the database tables(Check the manual to know what database migrations are):

		rake db:migrate

	12- Run the following command to insert records and seeds in the tables:

		rake db:seed

	13- Run the following the command to start the rails server:

		rails s
		or
		rails server

	14- The server should be running at localhost:3000 which is the root of the application.

	15- Visit localhost:3000 from your browser to check the application.


References:
https://gorails.com/setup/ubuntu