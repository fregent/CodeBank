class Directory < ApplicationRecord
  has_many :snippet
  belongs_to :user
  belongs_to :snippet
end
