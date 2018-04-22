require "sinatra/base"
require "mongoid"
require "./app/models/message"
require "./app/routes/app_route"
require "./app/routes/chat_route"
require "faye/websocket"

Mongoid.load!("config/mongoid.yml")
