wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
sudo apt-get install google-chrome-beta
sudo apt-cache search google-chrome-*
sudo apt-get install chromium-browser
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL
rbenv install 2.2.1
nano ~/.bashrc 
nano ~/.bash_profile 
rbenv install 2.2.1
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc 
echo 'eval "$(rbenv init -)"' >> ~/.bashrc 
exec $SHELL
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc 
exec $SHELL
rbenv install 2.2.1
rbenv global 2.2.1
ruby -v
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem install rails
gem install rails -v 4.2.0
rbenv rehash
rails -v
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
psql -p 5432 -U postgres -W
psql -h localhost board postgres
rails new board -d postgresql
sudo apt-get install libpq-dev
cd board/
bundle install
sudo apt-get install git
git config --global user.name "Roman Titov"
git config --global user.email "a1814805@yandex.ru"
git config --list
sudo apt-get install postgresql
sudo nano /etc/postgresql/9.3/main/postgresql.conf 
sudo -u postgres psql template1
sudo nano /etc/postgresql/9.3/main/pg_hba.conf 
sudo /etc/init.d/postgresql restart
sudo apt-get install postgresql-doc
psql -u postgres -p
psql --help
psql -p 5432 -U postgres -W
sudo mkdir -p /opt/Rubymine
sudo tar -zxvf Загрузки/RubyMine-2016.2.1.tar.gz --strip-components 1 -C /opt/Rubymine
sudo chown -R root:root /opt/Rubymine
sudo /opt/Rubymine/bin/rubymine.sh
sudo apt-get remove openjdk*
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo /opt/Rubymine/bin/rubymine.sh
mkdir rails-projects
cd rails-projects/
git clone git@github.com:/trv1/SMC.git
https://github.com/trv1/SMC.git
git clone https://github.com/trv1/SMC.git
cd ~
brew install nodejs
sudo apt-get install nodejs
cd rails-projects/
git clone https://github.com/omlook/skupka.git
rbenv install 2.3.1
rbenv global 2.3.1 
ruby -v
bundle update rails
echo "gem: --no-document" > ~/.gemrc
gem install bundler
bundle update rails
gem install rails -v 5.0.0
rails -v
rbenv rehash

irb
ll
rm board/
rmdir board/
rmdir --help
rmdir board/ --ignore-fail-on-non-empty 
rails new board -d postgresql
ll
rails new board -d postgresql
gem install minitest -v 5.9.0
cd board/
bundle install
/opt/Rubymine/bin/rubymine.sh
cd ~/board/
bundle install
rails g scaffold User name phone email password_digest
rails db:migrate
bundle install
rails g scaffold Shat pop
rails destroy scaffold Shat
rails s
cd board/
rails g controller Sessions
rails s
cd
sudo apt-get install git
git status
rails g controller Root
git init
git add .
git commit -m 'first commit'
git remote add origin https://github.com/trv1/board.git
git push origin master 
htop
sudo apt-get install htop
htop
irb
cd board/
rails g model Geoname geonameid:integer name asciiname latitude:decimal longitude:decimal feature_class feature_code country_code cc2 admin1_code admin2_code admin3_code admin4_code population:integer elevation:integer dem:integer timezone modification_date:date
rails g model Alternatename alternatename_id geoname:reference isolanguage alternatename isprefferedname:boolean isshortname:boolean iscolloquial:boolean ishistoric:boolean
rails destroy model Alternatename
rails g model Alternatename alternatename_id geoname:references isolanguage alternatename isprefferedname:boolean isshortname:boolean iscolloquial:boolean ishistoric:boolean
psql -U postgres -h localhost -p 5432 board
psql --help
psql -U postgres -h localhost -p 5432 board -W 123456
psql -U postgres -W 123456 -h localhost -p 5432 board
psql -U postgres -W123456 -h localhost -p 5432 board
psql -U postgres -W -h localhost -p 5432 board
psql -U postgres --password 123456 -h localhost -p 5432 board
HOME
${HOME}
psql -U postgres -h localhost -p 5432 -c "drop table qq;"
PGPASSWORD=123456 psql -U postgres -h localhost -p 5432 -c "drop table qq;"

