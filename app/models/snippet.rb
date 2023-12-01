class Snippet < ApplicationRecord

  include PgSearch::Model
  multisearchable against: [:title, :content, :language],
                  using: {
                    tsearch: { prefix: true, any_word: true, case_sensitive: false },
                    trigram: { threshold: 0.1 }
                  }

  belongs_to :user
  has_many :directories
end
