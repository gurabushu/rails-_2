class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one_attached :img
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
    has_many :reservations, dependent: :destroy
    has_many :rooms

    def full_name
      "#{first_name} #{last_name}"
    end

    def to_s
      full_name
    end


end
