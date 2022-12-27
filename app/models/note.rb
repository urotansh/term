class Note < ApplicationRecord
  
  belongs_to :user
  has_many :note_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :note_tags, dependent: :destroy
  has_many :tags, through: :note_tags
  
  scope :search, -> (name) { where('title LIKE ?', "%#{name}%") }
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
