class Snippet < ApplicationRecord

include PgSearch::Model
multisearchable against: [:title, :content, :language]

belongs_to :user
has_many :directories

end
