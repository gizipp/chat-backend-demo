require 'spec_helper.rb'

describe 'Routes' do
  it "OK!" do
    get "/v1/chat"
    expect(last_response.status).to eq(200)
  end

  it "Get message!" do
    Message.create(text: 'Bob how are you?')

    get "/v1/chat"
    expect(last_response.body).to include('Bob how are you?')
  end

  it "limit the message!" do
    Message.create(text: 'Bob how are you?')
    Message.create(text: 'Fine')
    Message.create(text: 'Okay. do love me?')
    Message.create(text: 'Not sure')

    get "/v1/chat?limit=2"
    json_body = JSON.parse(last_response.body)
    expect(json_body.size).to eq(2)
  end

  it "query the message by before date" do
    Message.create(text: 'Bob how are you?', created_at: 3.days.ago)
    Message.create(text: 'Bob how are you?', created_at: 1.days.ago)
    Message.create(text: 'Fine!')

    get "/v1/chat?before=#{2.days.ago.iso8601}"
    json_body = JSON.parse(last_response.body)
    expect(json_body.size).to eq(1)
  end

  it "Send message" do
    post "/v1/chat", text: 'Fine'
    expect(last_response.body).to include('Fine')
  end
end
