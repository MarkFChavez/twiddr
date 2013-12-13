class User < ActiveRecord::Base
  include Searchable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :name, presence: true

  has_many :twidds, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :inverse_relationships, class_name:"Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :inverse_relationships, source: :follower

  def is_logged_in?
  	!!self
  end

  def following?(user)
    !!relationships.find_by_followed_id(user.id)
  end

  def follow!(user)
    relationships.create!(followed_id: user.id)
  end
end
