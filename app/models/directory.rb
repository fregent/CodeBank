class Directory < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name],
                  using: {
                    tsearch: { prefix: true, any_word: true, case_sensitive: false },
                    trigram: { threshold: 0.3 }
                  }

  belongs_to :user
  has_many :directories_snippets
  has_many :snippets, through: :directories_snippets, dependent: :destroy
end
