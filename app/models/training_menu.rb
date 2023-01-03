class TrainingMenu < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :muscle_category
  has_many :menu_records, dependent: :destroy
  has_many_attached :images
  belongs_to :user

  validates :name, :explanation, presence: true
  validates :muscle_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :images, length: { maximum: 3, message: "画像は3枚以下にしてください" }

  def self.search(search)
    if search != ''
      TrainingMenu.where('name LIKE(?)', "%#{search}%")
    else
      TrainingMenu.all
    end
  end
end
