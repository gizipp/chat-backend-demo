# Chat Backend Demo

A kind of basic chat API backend.

# Features
  1. API to send message
  2. API to retrieve message
  3. API to retrieve message at realtime

# REST API

  - POST `/v1/chat`
  - GET `/v1/chat`

#### POST `/v1/chat` sending message

It send message.

##### Parameters:

Its accepts via form-data, x-www-form-urlencoded or json body data. Required parameters are :
  - text: The message text maximum 500 chars. (Required)

#### Example Usage:

`curl -X POST https://chat-backend-demo.herokuapp.com/v1/chat -d '{"text": "How are you?"}'`

#### GET `/v1/chat` retrieving message

It returns messages.

##### Parameters:

Optional query parameters are :

 - before: The start point of the created_at in result messages. It must be RFC3339 form. (Optional)
 - limit: The number of result messages. Default : 10 (Optional)

  Request JSON:

  ```
    {
      "before": "time with ISO8601 format",
      "limit": limit_number,
  }
  ```

  response JSON:

  ```
  [
    {
        "_id": message_object_id,
        "text":  "<message content>",
        "created_at": created_at,
    },
    ...
  ]   
```

#### Example Usage:

`curl -X GET 'https://chat-backend-demo.herokuapp.com/v1/chat?before=2018-04-23T04:14:12+07:00&limit=5'`

will returns queried result which contains 10 messages and all of these are created before 2018/04/23 04:14:12

# Stream API
  -  `/v1/chat/stream`

  The server can accepts the Websocket connetion at `/v1/chat/stream`

#### Example Usage :

  via Curl

  `curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: chat-backend-demo.herokuapp.com" -H "Origin: https://chat-backend-demo.herokuapp.com" chat-backend-demo.herokuapp.com/v1/chat/stream`

   Result :

   ```
   HTTP/1.1 101 Switching Protocols
Connection: Upgrade
Upgrade: WebSocket
Websocket-Origin: https://chat-backend-demo.herokuapp.com
Websocket-Location: wss://chat-backend-demo.herokuapp.com/v1/chat/stream
Via: 1.1 vegur


{"_id":{"$oid":"5add2c701ab7ad0004e7939b"},"created_at":"2018-04-23T00:44:32.322+00:00","text":"How are you?"}
{"_id":{"$oid":"5add2c711ab7ad0004e7939c"},"created_at":"2018-04-23T00:44:33.578+00:00","text":"Fine?"}
{"_id":{"$oid":"5add2c721ab7ad0004e7939d"},"created_at":"2018-04-23T00:44:34.886+00:00","text":"Okay?"}
```
