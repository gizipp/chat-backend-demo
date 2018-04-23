# Decision Docs

## Problem Domain

It's like chatroom. The client could send message, and retrieve the previous message. Since it's chat app, it needs to realtime.

## Language

Using Ruby as main backend, because is to having a large standard library and easiest/minimal effort to create APIs.

Alternative :
- Golang. Fast concurrency model. It's goroutines which saves memory and improves performance.
- Node.js. We are using, mongoDb. Using node.js makes more effiecients.

Benefits :
- More agile and great for prototyping
- Fast development

Risk :
- Ruby tends to be more slow and consume more memory

Solution :
- Keep on horizontal scaling until scale out, and prepare create next version in Go/Node.js

# Web Server

Puma is chosen. It not only it's standard for current Ruby webserver, because it's built for concurrency.

# API Design

## Versioning

```
https://chat-backend-demo.herokuapp.com/v1/chat
https://chat-backend-demo.herokuapp.com/v2/chat
https://chat-backend-demo.herokuapp.com/v3/chat
```

Do versioning in the URI. This can be tractable and even esthetically pleasing. The risk still [in debate](https://stackoverflow.com/questions/389169/best-practices-for-api-versioning) but it is still widely used.

## Resources

Chat in singular, because it more like single conversation (chatroom) in real world. Just in case, there are many chat(rooms) in the future, the design would be :

```
https://chat-backend-demo.herokuapp.com/v1/chat #all conversation
https://chat-backend-demo.herokuapp.com/v1/chat/:chat_id/messages #certain conversation
https://chat-backend-demo.herokuapp.com/v2/chat/:chat_id/messages/stream #stream from certain conversation
```
