class Post < ActiveRecord::Base

  belongs_to :admin_user
  has_and_belongs_to_many :images

  extend FriendlyId
  friendly_id :title, :use => :slugged
  validates_format_of :slug, :with => /\A[a-z0-9-]+\z/i

  validates_presence_of :title, :date, :status

  validates_uniqueness_of :slug

  # scope
  scope :posts_only, -> { where(:type => nil) }
  default_scope -> { order("date DESC") }

  scope :published, -> { where(:status => "published") }

  scope :for_user, -> {|user_id| where(:admin_user_id => user_id)}

  # delegate post.admin_user.email to post.email ;)
  delegate :email, :to => :admin_user, :allow_nil => true

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

end
