class Snippet < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  has_many :directories
=======
  has_many :directories
  belongs_to :user
>>>>>>> master
end
