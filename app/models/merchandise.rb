class Merchandise < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:attachment/missing_:style.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, :price, presence: true
  validates :description, length: { maximum: 500 }
end
