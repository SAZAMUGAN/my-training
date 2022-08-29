class TrainingMenu < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user 
  belongs_to :muscle_category

  validates :name, :explanation, presence: true
  validates :muscle_category_id, numericality: { other_than: 1 ,message: "can't be blank"} 
end
