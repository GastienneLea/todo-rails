class UserResource < ApplicationResource
  attribute :username, :string
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  has_many :tasks
end
