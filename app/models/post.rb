class Post < ActiveRecord::Base

  validates_uniqueness_of :slug

  belongs_to :admin_user

end
