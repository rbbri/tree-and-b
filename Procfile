build:
  languages:
    - ruby
run:
  rake: bundle exec rake
  rake: rake db:create
  rake: rake db:schema:load
  web: bundle exec puma config.ru -p $PORT
