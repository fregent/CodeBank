class Directory < ApplicationRecord

  include PgSearch::Model
  multisearchable against: [:name],
                  using: {
                    tsearch: { prefix: true, any_word: true, case_sensitive: false },
                    trigram: { threshold: 0.3 }
                  }
  belongs_to :user
  has_many :directory_snippets
  has_many :snippets, through: :directory_snippets
end
