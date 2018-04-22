KEEPALIVE_TIME = 15

class AppRoute < Sinatra::Base
  def initialize app
    super()
    @clients = []
  end

  get '/' do
    halt 200
  end

  not_found do
    status 404
    create_response( {"error" => "Not Found" }.to_json, 404 )
  end

  def create_response(body, status)
    response = Array.new(2)
    response[0] = status
    response[1] = body
    return response
  end
end
