# Fonix Chat Challenge

This challenge includes:
- User authentication
- Realtime chat using ActionCable

## Initial Install

After database creation, please run 
```rails db:seed```
This will seed a default Chatroom Channel "General"

This app uses `Redis` server to deliver chat messages, therefore will require Redis installation

## Chatroom Channels
The app is create to enable future scaling to multiple chatrooms in the future.

There are model associations that allow such scaling up in the futre, but for now, new users are automatically added to one chatroom, i.e. the General chatroom