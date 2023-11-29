class Snippet < ApplicationRecord
  has_many :directories
  belongs_to :user
end
