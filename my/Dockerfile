FROM jun2org/docker:ubuntu16-python3.6

# Install
RUN apt-get update

## Install packages
RUN apt-get install -y memcached nginx supervisor git

## Clean up
RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

## Install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD cert /etc/nginx/cert
ADD nginx.conf /etc/nginx/conf.d/
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

## Install uwsgi
ADD uwsgi.ini /etc/uwsgi/
RUN pip install uwsgi

## Install supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

## Install source
WORKDIR /htdocs/www
RUN git clone https://github.com/jun2org/my.git ./

## Install pip packages
RUN make python-package-install

# Setting working env
VOLUME ["/htdocs/www"]
EXPOSE 80
EXPOSE 443

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/usr/bin/supervisord"]
