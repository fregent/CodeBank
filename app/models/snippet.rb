class Snippet < ApplicationRecord
  belongs_to :user
  has_many :directories
end
