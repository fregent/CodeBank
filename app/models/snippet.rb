# app/models/snippet.rb
class Snippet < ApplicationRecord

  belongs_to :user
  has_many :directories_snippets
  has_many :directories, through: :directories_snippets
  has_many :comments, dependent: :destroy
  has_many :likes
  validates :title, :content, :language, presence: true
end
