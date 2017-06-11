class Book < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  validates :genre, presence: true, inclusion: {in: %w(Фантастика Фэнтези Ужасы Повесть Рассказ Боевик Бизнес Классика Роман Детектив Саморазвитие Профессиональная Психология Остальное),
                                                message: '%{value} - недопустимый жанр'}
  validates :img, presence: true, :on => :create
  validates :note, length: {maximum: 100}

  mount_uploader :img, BookImgUploader
  belongs_to :user
end
