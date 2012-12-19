class Page < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true,
                   exclusion: {in: %w[signup login]}
                   
  attr_accessible :content, :name, :slug, :parent_id
  
  has_ancestry
  
  before_validation :generate_slug
  
  def to_param
    slug # or "#{id}-#{name}".parameterize
  end
  
  def generate_slug
    self.slug ||= name.parameterize
  end
  
end
