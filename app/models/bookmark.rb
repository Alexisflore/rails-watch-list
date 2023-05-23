class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :list_id, :movie_id, presence: true
  validates_uniqueness_of :list_id, scope: [:movie_id]
  validates :comment, length: { minimum: 6 }
end
