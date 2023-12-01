class Directory < ApplicationRecord

  include PgSearch::Model
  multisearchable against: [:name],
                  using: {
                    tsearch: { prefix: true, any_word: true, case_sensitive: false },
                    trigram: { threshold: 0.3 }
                  }
  belongs_to :user
  has_and_belongs_to_many :snippets
end
