# Make Money Admin

An admin panel for make money android application.


Features
--------

- Signup/Login admin users
- Enable/Disable any advertise platform (eg. Google Admon, Facebook ads)
- Redeem Requests Page
- User Block/Unblock
- Push Notifications for user


Gems
----

- Carrierwave
- mini_magick
- devise
- sidekiq


Installation
------------

        git clone http://www.github.com/maanavshah/make-money-admin

        cd make-money-admin

        bundle install

        rake db:create

        rake db:migrate

        rails s


Heroku Deployment
-----------------

https://devcenter.heroku.com/articles/getting-started-with-rails5


1.  Login heroku

        heroku login

2.  Add heroku remote make-money-admin

        heroku git:remote -a make-money-admin

3.  Push code heroku master

        git push heroku master

4.  Add postgresql addon to heroku

        heroku addons:create heroku-postgresql:hobby-dev

5.  Rake setup (No need for rake db:create)

        heroku run rake db:migrate

6.  Add environment variables GMAIL

        heroku config:add GMAIL_USERNAME=usernam@email.com
        heroku config:add GMAIL_PASSWORD=password

7.  Scale Web application

        heroku ps:scale web=1

8.  Open website in browser

        heroku open

9. Check Logs

        heroku logs
        heroku logs --tail

10. Bundle rails console and sidekiq

        heroku run bundle exec rails c
        heroku run bundle exec sidekiq

Gem alternatives
----------------

- devise        -  JWT (authentication and authorization)
- god           -  track sidekiq/nginx if disabled, then automatically re-enable
- foundation    -  bootstrap
- scss          -  sass mixin
- carrierwave   -  ActiveStorage
- state-machine
- kaminari
- turbolinks
- jbuilder
