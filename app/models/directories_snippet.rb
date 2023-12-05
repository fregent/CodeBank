class DirectoriesSnippet < ApplicationRecord
  belongs_to :snippet
  belongs_to :directory

  before_create :set_created_at

  private

  def set_created_at
    self.created_at = Time.current
  end
end
