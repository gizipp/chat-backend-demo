require 'spec_helper.rb'

describe 'Routes' do
  it "OK!" do
    get "/v1/chat"
    expect(last_response.status).to eq(200)
  end

  it "Get message!" do
    get "/v1/chat"
    Message.create(text: 'Bob how are you?')
    expect(last_response.body).to include('Bob how are you?')
  end

  it "Send message" do
    post "/v1/chat", text: 'Fine'
    expect(last_response.body).to include('Fine')
  end
end
