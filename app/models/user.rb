class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :avatar
  # attr_accessible :title, :body
  
  mount_uploader :avatar, FileUploader
  
  has_many :posts
  has_many :comments
  has_many :uploads
  has_many :projects
  
end
