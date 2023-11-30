class Directory < ApplicationRecord
  belongs_to :user
  has_many :snippets
end
