class News < ApplicationRecord
  validates :title, :paragraph_one, :category, presence: true
  validates :paragraph_one, :paragraph_two, :paragraph_three, length: { maximum: 500 }
  validate :valid_category

  protected

  def valid_category
    options = ["Captains", "Players", "Tournaments"]

    if category.present? && !options.include?(category)
      errors.add(:category, "must be Captains, Players or Tournaments")
    end
  end
end
