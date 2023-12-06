# app/models/snippet.rb
class Snippet < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :content, :language],
                  using: {
                    tsearch: { prefix: true, any_word: true, case_sensitive: false },
                    trigram: { threshold: 0.1 }
                  }
  belongs_to :user
  has_many :directories_snippets
  has_many :directories, through: :directories_snippets
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :reviews, dependent: :destroy
  validates :title, :content, :language, presence: true
end
