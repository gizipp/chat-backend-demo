class ChatRoute < AppRoute
  post '/v1/chat' do
    payload = JSON.parse(request.body.read) rescue {}
    text    = params[:text] || payload["text"]
    message = Message.new(text: text)

    if message.save
      @clients.each { |ws| ws.send(message.to_json) }
      return message.to_json
    else
      return create_response( message.errors.to_json, 422 )
    end
  end

  get '/v1/chat' do
    limit = params[:limit] || DEFAULT_LIMIT

    begin
      if params[:before].present?
        datetime = Time.iso8601(params[:before]
                       .gsub(" ","+"))
        m = Message.where( created_at: { :$lte => datetime } )
                   .limit(limit)
      else
        m = Message.limit(limit)
      end

      m.to_json

    rescue
      create_response( {"error" => "Invalid Params" }.to_json, 422 )
    end
  end

  get '/v1/chat/stream' do
    if Faye::WebSocket.websocket?(env)
      ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })
      ws.on :open do |event|
      @clients << ws
    end

    ws.on :message do |event|
      ws.send(event.data)
    end

    ws.on :close do |event|
      @clients.delete(ws)
      ws = nil
    end

    ws.rack_response
    else
      create_response( {"error" => "Not Found" }.to_json, 404 )
    end
  end
end
