class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  has_many :bookmarks
  before_destroy :check_for_bookmarks

    private

  def check_for_bookmarks
    unless bookmarks.nil?
      self.errors[:base] << "Cannot delete this movie while it has bookmarks"
    end
  end
end
