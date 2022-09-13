class MenuRecord < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :form_level
  belongs_to :training_menu
  

  validates :date, presence: true
  validates :form_level_id, numericality: { other_than: 1, message: "can't be blank" }
end
