class Category < ActiveRecord::Base
   
  has_many :article_categories
  has_many :articles, through: :article_categories  
  
  validates :name, presence: true, length:{ minimum: 3, maximum: 25}
  validates_uniqueness_of :name
  
  has_attached_file :avatar, styles: { big: "430x940>", thumb: "100x100>" }, default_url: "Category_Missing.png",     
    :storage => :s3,
    :bucket => "gotarticles"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end