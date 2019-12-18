class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
end
