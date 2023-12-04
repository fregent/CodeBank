class Snippet < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :content, :language],
                  using: {
                    tsearch: { prefix: true, any_word: true, case_sensitive: false },
                    trigram: { threshold: 0.1 }
                  }
  belongs_to :user
  has_many :directory_snippets
  has_many :directories, through: :directory_snippets
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :directory_snippets
  validates :title, :content, :language, presence: true
end
