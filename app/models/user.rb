class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :active, :full_name, :cell_phone, :sync_password
  # attr_accessible :title, :body
  
  has_many :user_locations
  has_many :locations, :through => :user_locations
  
  validates_uniqueness_of :email
  validates_presence_of :cell_phone
  
  def gravatar_path(size=16, email=self.email)
    require 'digest'
    
    hash = Digest::MD5.hexdigest(email)
    
    "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end
end
