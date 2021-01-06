class Article < ActiveRecord::Base
  #an article can have many comment
  #if an article is deleted, its dependents(comments) will also be destroyed
  has_many :comments, dependent: destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
