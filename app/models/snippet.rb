class Snippet < ApplicationRecord

  include PgSearch::Model
  multisearchable against: [:title, :content, :language],
                  using: {
                    tsearch: { prefix: true, any_word: true, case_sensitive: false },
                    trigram: { threshold: 0.1 }
                  }
  has_and_belongs_to_many :directories
end
