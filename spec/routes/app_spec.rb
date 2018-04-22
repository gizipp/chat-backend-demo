require 'spec_helper.rb'

describe 'Routes' do
  it "Root ok!" do
    get "/"
    expect(last_response.status).to eq(200)
  end
end
