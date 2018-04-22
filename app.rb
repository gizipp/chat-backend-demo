require "./boot"

class App < Sinatra::Base
  configure do
    set :server, :puma
  end

  use ChatRoute
end
