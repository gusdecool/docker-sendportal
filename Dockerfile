FROM gusdecool/symfony:php8.3
WORKDIR /app

# install ext-pcntl, required by laravel/horizon
RUN install-php-extensions pcntl

# openspout/openspout[v4.21.0, ..., 4.x-dev] require ext-zip
RUN install-php-extensions zip

COPY /sendportal /app
RUN composer install --no-interaction

# allow to write logs
RUN chmod -R 777 /app/storage

# SendPortal installation
RUN php artisan vendor:publish --provider=Sendportal\\Base\\SendportalBaseServiceProvider
RUN touch .env
RUN chmod -R 777 .env

# add cron job
RUN mkdir -p /etc/cron.d
RUN echo "* * * * * cd /app && php artisan schedule:run >> /dev/null 2>&1" | tee /etc/cron.d/sendportal
