class User < ActiveRecord::Base
    
  has_many :articles, dependent: :destroy
  
  before_save { self.email = email.downcase}
  
  validates :username, presence: true, 
            length: { minimum: 3, maximum: 20},
            uniqueness: { case_sensitive: false }
            
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, 
            length: { maximum: 106},
            format: { with: VALID_EMAIL_REGEX}
            
  has_secure_password  
  
  has_attached_file :avatar, styles: { medium: "280x280>", thumb: "100x100>" }, default_url: "user_missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end