class Note < ApplicationRecord
  
  belongs_to :user
  has_many :note_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  scope :search, -> (name) { where('title LIKE ?', "%#{name}%") }
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
