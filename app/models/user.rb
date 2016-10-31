class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :recipes, dependent: :destroy
  # has_many :time_frames, dependent: :destroy
  # has_many :tags, through: :recipes, dependent: :destroy


end
