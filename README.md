# docker-lodge

## Configuration

reference to https://github.com/lodge/lodge

**docker-compose.yml**
```
      SECRET_KEY_BASE: __some_random_string__
      DEVISE_SECRET_KEY: __some_random_string__
      GOOGLE_CLIENT_ID: 
      GOOGLE_CLIENT_SECRET: 
      LODGE_DOMAIN: localhost:3000
      DELIVERY_METHOD: smtp
      MAIL_SENDER: example@example.com
      SMTP_ADDRESS: smtp.google.com
      SMTP_PORT: 587
      SMTP_USERNAME: username
      SMTP_PASSWORD: password
      SMTP_AUTH_METHOD: plain
      SMTP_ENABLE_STARTTLS_AUTO: 'true'
      SMTP_OPENSSL_VERIFY_MODE: none
      LODGE_THEME: lodge
      SYNTAX_HIGHLIGHT_THEME: pastie
```

## Setup

```
docker-compose up -d mysql
docker-compose build rails
docker-compose run --rm rails rake db:create db:migrate
docker-compose up -d rails
```

access to http://localhost:3000

## References

* [qiitaのクローンLodgeをdocker compose対応したよー](http://qiita.com/Jey/items/305238765eb5c7cd7810)
* https://github.com/j138/lodge-docker
