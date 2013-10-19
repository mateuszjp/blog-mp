class Comment < ActiveRecord::Base
  validates_presence_of :name, :content, :post_id

  belongs_to :post
end
