class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :name, presence: true
  validates :feeds, presence: true


end
