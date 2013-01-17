class Post < ActiveRecord::Base

  attr_accessible :content, :title, :user, :slug
  belongs_to :user
  has_many :comments, as: :commentable
  
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  
  validates :slug, uniqueness: true, presence: true,
                   exclusion: {in: %w[signup login]}
  
  before_validation :generate_slug
  
  def to_param
    slug # or "#{id}-#{name}".parameterize
  end
  
  def generate_slug
    self.slug ||= title.parameterize
  end
  
  
end
