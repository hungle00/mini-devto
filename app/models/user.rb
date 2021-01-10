class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_username

  def to_param
    username
  end

  def favorite(article)
    favorites.find_or_create_by(article: article)

    article.reload
  end

  def unfavorite(article)
    favorites.where(article: article).destroy_all

    article.reload
  end

  def favorited?(article)
    favorites.find_by(article_id: article.id).present?
  end
  
  # attr_writer :login
    
  # def login
  #   @login || username || email
  # end

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
  #   elsif conditions.key?(:username) || conditions.key?(:email)
  #     where(conditions.to_h).first
  #   end
  # end
end
