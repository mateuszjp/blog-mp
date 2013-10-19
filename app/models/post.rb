class Post < ActiveRecord::Base
  belongs_to :cattegory
  validates_presence_of :title, :content, :cattegory_id
end
