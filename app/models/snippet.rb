# app/models/snippet.rb
class Snippet < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :pg_search,
  against: [:title, :content],
  using: {
    tsearch: { prefix: true },
    trigram: { threshold: 0.2 }
  }


  belongs_to :user
  has_many :directories_snippets
  has_many :directories, through: :directories_snippets
  has_many :comments, dependent: :destroy
  has_many :likes
  validates :title, :content, :language, presence: true
end
