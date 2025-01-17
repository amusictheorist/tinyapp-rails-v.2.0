class Url < ApplicationRecord
  belongs_to :user
  validates :long_url, presence: true
  validates :short_url, uniqueness: true
end
