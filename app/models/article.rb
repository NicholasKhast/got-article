class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  validates :title, presence: true, length:{ minimum: 3, maximum: 60}
  validates :description, presence: true, length:{ minimum: 10}
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/Article_Missing.jpg",    
    :storage => :s3,
    :path => ":attachment/:id/:style.:extension",
    :bucket => "gotarticles"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end