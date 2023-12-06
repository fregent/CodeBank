class Directory < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :pg_search_directory,
  against: [:name],
  using: {
    tsearch: { prefix: true },
    trigram: { threshold: 0.2 }
  }


  belongs_to :user
  has_many :directories_snippets
  has_many :snippets, through: :directories_snippets, dependent: :destroy
end
