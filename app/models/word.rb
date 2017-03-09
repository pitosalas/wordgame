class Word < ApplicationRecord
  validates :eng, presence: true
  validates :ned, presence: true

  def self.random
    offset = rand(Word.count)
    Word.offset(offset).first
  end
end
