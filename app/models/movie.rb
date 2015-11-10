class Movie < ActiveRecord::Base
  validates :director_id, :presence=> true
  validates :title, :presence=> true
  validates :year, numericality: { only_integer: true, greater_than: 1870, less_than: 2050}
  validates :duration, numericality: { only_integer: true, greater_than: 0, less_than: 2764800}
  validates :title, uniqueness: { scope: :year }

  belongs_to :director, :class_name => "Director", :foreign_key => "director_id"
  has_many :characters, :class_name => "Character", :foreign_key => "movie_id"
  # belongs_to :director
end
