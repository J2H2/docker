FROM jun2org/docker:ubuntu16-python3.6

# Install
RUN apt-get update

## Install packages
RUN apt-get install -y memcached

## Clean up
RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

## Install pip packages
ADD ./requirement.txt requirement.txt 
RUN pip3 install -r requirement.txt

# Setting working env
VOLUME /htdocs/www
EXPOSE 8000

WORKDIR /htdocs/www

CMD make run
