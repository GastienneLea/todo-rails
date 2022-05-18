class TaskResource < ApplicationResource
  attribute :title, :string
  attribute :is_completed, :boolean
  attribute :due_at, :datetime
  attribute :details, :string

  belongs_to :user

  filter :user_id, :integer

  def base_scope
    Task.where(user_id: current_user)
  end
end
