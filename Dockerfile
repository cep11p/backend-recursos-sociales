FROM cep11p/php_yii_ds:1.0

COPY --chown=www-data:www-data . /var/www/html

RUN mkdir -p /var/www/html/runtime/sessions /var/www/html/web/assets /var/www/html/runtime/cache /var/www/html/_files /queue
RUN touch /var/www/html/runtime/logs/app.log
RUN chown www-data:www-data /var/www/html/runtime/sessions /var/www/html/runtime/cache /var/www/html/web/assets /var/www/html/_files /var/www/html/runtime/logs/app.log /queue

WORKDIR /var/www/html
