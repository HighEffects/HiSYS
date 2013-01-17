class Page < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true,
                   exclusion: {in: %w[signup login]}
                   
  attr_accessible :content, :name, :slug, :parent_id
  
  has_ancestry
  
  has_many :comments, as: :commentable
  
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  
  before_validation :generate_slug
  
  def to_param
    slug # or "#{id}-#{name}".parameterize
  end
  
  def generate_slug
    self.slug ||= name.parameterize
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  
end
