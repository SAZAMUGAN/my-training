class TrainingMenu < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :muscle_category
  has_many :menu_records 
  belongs_to :user 

  validates :name, :explanation, presence: true
  validates :muscle_category_id, numericality: { other_than: 1 ,message: "can't be blank"} 
end
