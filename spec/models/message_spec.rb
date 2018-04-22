require 'spec_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps.for(:creating) }
  it { is_expected.to_not have_timestamps.for(:updating) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to validate_length_of(:text).with_maximum(499).with_minimum(1) }
end
