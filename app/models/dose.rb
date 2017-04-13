class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presente: true
  validates :cocktail_id, presente: true
  validates :ingredient_id, presence: true
end
