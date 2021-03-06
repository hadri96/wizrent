class Wizard < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :species, presence: true
  validates :description, presence: true
  validates :house, presence: true

  include PgSearch::Model
  pg_search_scope :similarity_like,
                  against: :name,
                  using: {
                    trigram: {
                      word_similarity: true
                    }
                  }


end
