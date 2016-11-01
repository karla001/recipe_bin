class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true
  validates :feeds, presence: true
  validates :public_view, presence: true



end
