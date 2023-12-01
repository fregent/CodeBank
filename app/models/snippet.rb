class Snippet < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :content, :language]
  belongs_to :user
  has_and_belongs_to_many :directories
  has_many :comments, dependent: :destroy
end
