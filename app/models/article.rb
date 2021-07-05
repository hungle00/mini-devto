class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false
  validates :slug, uniqueness: true, exclusion: { in: ['feed'] }

  has_rich_text :body
  has_one_attached :main_image
  is_impressionable
  
  before_validation do
    self.slug ||= "#{title.to_s.parameterize}-#{rand(36**6).to_s(36)}"
  end

  acts_as_taggable_on :tags

  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: false) }
  scope :authored_by, -> (username) { where(user: User.where(username: username)) }
  scope :favorited_by, -> (username) { joins(:favorites).where(favorites: {user: User.where(username: username)} )}

  def to_param
    slug
  end

  def self.impressions
    impression.where(impressionable_type: "Article")
  end

  def self.search(term)
    if term.present?
      where("title LIKE ?", "%#{term}%")
    else
      all
    end
  end
end
