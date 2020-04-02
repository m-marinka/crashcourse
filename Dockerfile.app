FROM ubuntu:18.04

Label author="Marinka"
#set timezone
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#update system
RUN apt-get update -y
RUN apt-get upgrade -y

#install Apache
RUN apt-get install -y apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

#install PHP
RUN apt-get install -y php
RUN apt-get install -y php-dev
RUN apt-get install -y php-mysql
RUN apt-get install -y libapache2-mod-php
RUN echo "<?php phpinfo(); ?>" > /var/www/html/info.php

#restart apache
CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod rewrite

#expose ports
EXPOSE 80
EXPOSE 443
