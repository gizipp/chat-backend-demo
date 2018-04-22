require 'mongoid'

class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :text, type: String

  validates :text, presence: true, length: { minimum: 1, maximum: 499 }
end
