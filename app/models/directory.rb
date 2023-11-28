class Directory < ApplicationRecord
  belongs_to :user
  belongs_to :snippet
  has_many :snippets
end
