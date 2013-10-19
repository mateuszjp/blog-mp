class Post < ActiveRecord::Base
  belongs_to :cattegory
  has_many :comments
  validates_presence_of :title, :content, :cattegory_id
end
