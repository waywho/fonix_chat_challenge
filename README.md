# Fonix Chat Challenge

This challenge includes:
- User authentication
- Realtime chat using ActionCable
- Weekly Scheduled Mailer for Message Stats Notification

## Infrastructure

### User Authentication

`Devise` gem is used for User Authentication. User email requires validation through email confirmation

### Realtime chat using ActionCable

One chatroom channel is programmed as required. All users are added to the chatroom channel upon creation.

### Weekly Email Notification

`sidekiq` gem and `sidekiq-cron` gem are used to enque weekly email notification to all users. The background queue system is used to ensure that the mail delivery does not interfere with the main app functionalities.

## Installation

After database creation, please run 
```rails db:seed```
This will seed a default Chatroom Channel "General"

## Requirements & Configurations

This app requires `Redis` server installation to deliver chat messages, ensure to start `redis-server` for production deployment.

ActionMailer smtp configuration is required in `config/environments/production.rb` for the production enviornment in order for both User account confirmation and weekly email notification. An example is added but commented out for ease of configuration.

## Chatroom Channels
The app is create to enable future scaling to multiple chatrooms in the future.

There are model associations that allow such scaling up in the futre, but for now, new users are automatically added to one chatroom, i.e. the General chatroom

## Author

WeiHsi Hu