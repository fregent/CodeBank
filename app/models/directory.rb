class Directory < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]

  belongs_to :user
  has_many :snippets
end

PgSearch::Multisearch.rebuild(Snippet)
PgSearch::Multisearch.rebuild(Directory)
  results = PgSearch.multisearch('ruby')

  results.each do |result|
    puts result.searchable
  end
