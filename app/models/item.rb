class Item < ActiveRecord::Base
  attr_accessible :currency, :description, :name, :human_price, :short_description, :category, :cover, :user
  
  has_many :comments, as: :commentable
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  has_many :assets
  has_many :shopping_cart_items
  belongs_to :user
  
  validates :slug, uniqueness: true, presence: true,
                     exclusion: {in: %w[signup login]}
                     
  before_validation :generate_slug
  
  mount_uploader :cover, FileUploader
  
  def human_price
    price.to_d/100 if price
  end
    
  def human_price=(dollars)
    self.price = dollars.to_d * 100 if dollars.present?
  end
  
  def to_param
    slug # or "#{id}-#{name}".parameterize
  end
  
  def generate_slug
    self.slug ||= name.parameterize
  end
  
end
