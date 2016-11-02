class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true
  validates :feeds, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
