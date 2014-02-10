class Image < ActiveRecord::Base

  has_and_belongs_to_many :posts

  extend FriendlyId
  friendly_id :title, :use => :slugged
  validates_format_of :slug, :with => /\A[a-z0-9-]+\z/i

  validates_presence_of :title, :slug

  validates_uniqueness_of :slug

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  mount_uploader :image, ImageUploader

end