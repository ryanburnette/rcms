class Post < ActiveRecord::Base

  belongs_to :admin_user
  has_and_belongs_to_many :images

  extend FriendlyId
  friendly_id :title, :use => :slugged
  validates_format_of :slug, :with => /\A[a-z0-9-]+\z/i

  validates_presence_of :title, :date, :status

  validates_uniqueness_of :slug

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

end
