class Post < ActiveRecord::Base

  belongs_to :admin_user

  extend FriendlyId
  friendly_id :title, :use => :slugged
  validates_format_of :slug, :with => /\A[a-z0-9-]+\z/i

  validates_presence_of :title, :date, :status

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

end
