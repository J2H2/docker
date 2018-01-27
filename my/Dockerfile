FROM jun2org/docker:ubuntu16-python3.6

# Install
RUN apt-get update

## Install packages
RUN apt-get install -y memcached nginx supervisor

## Clean up
RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

## Install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/conf.d/
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

## Install uwsgi
ADD uwsgi.ini /etc/uwsgi/
RUN pip install uwsgi

## Install supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

## Install pip packages
ADD ./requirement.txt requirement.txt 
RUN pip3 install -r requirement.txt

# Setting working env
VOLUME ["/htdocs/www"]
EXPOSE 80
EXPOSE 443

WORKDIR /htdocs/www

CMD ["/usr/bin/supervisord"]
