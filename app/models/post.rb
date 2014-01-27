class Post < ActiveRecord::Base

  validates_uniqueness_of :slug

end
