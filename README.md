# Chat Backend Demo

A kind of basic chat API backend.

# Features
  1. API to send message
  2. API to retrieve message
  3. API to retrieve message at realtime

# REST API
  - POST `/v1/chat`
  - GET `/v1/chat`

It returns messages.

Query Paramters:

 - before: The start point of the created_at in result messages. It must be RFC3339 form.
 - limit: The number of result messages.

Request JSON:

```
  {
    "before": "time with ISO8601 format",
    "limit": limit_number,
}```

response JSON:

```
[
  {
      "_oid": message_object_id,
      "text":  "<message content>",
      "created_at": created_at,
  },
  ...
]
```

Example:

localhost:4567/v1/chat?before=2018-04-23T04:14:12.237+07:00&limit=100

GET /chat?before=2018-04-23T04:14:12.237+07:00&limit=10 will returns queried result which contains 10 messages and all of these are created before 2018/04/23 04:14:12.

# Stream API
  -  `/v1/chat/stream`

  The server can accepts the Websocket connetion at `/v1/chat/stream`
