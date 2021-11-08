class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :administrated_events, foreign_key: 'admin_id', class_name: 'Event'

  has_many :attendances
  has_many :events, through: :attendances
end
