class Directory < ApplicationRecord
  has_many :snippets
  belongs_to :user
end
