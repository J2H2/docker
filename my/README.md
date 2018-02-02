```
openssl req -new -newkey rsa:2048 -nodes -keyout dev.key -out dev.csr -subj "/C=KR/ST=Seoul/L=Gang-nam/O=SecureSign Inc/OU=Dev Team/CN=*.dev.jun2.org"
openssl x509 -req -days 365 -in dev.csr -signkey dev.key -out dev.crt
cp dev.key dev.key.secure
openssl rsa -in dev.key.secure -out dev.key
```
