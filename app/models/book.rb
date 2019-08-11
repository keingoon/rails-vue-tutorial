class Book < ApplicationRecord
  validates :name, exclusion: { in: [nil, ""] }
  validates :author, exclusion: { in: [nil, ""]}
  validates :amazon_url, exclusion: {in: [nil] }
  validates :memo, exclusion: { in: [nil] }
end
