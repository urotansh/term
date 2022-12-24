class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # ゲストユーザ情報取得(存在しない場合、既定値で作成)
  def self.guest
    find_or_create_by!(name: "guestuser", email: "guest@guest.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
end
