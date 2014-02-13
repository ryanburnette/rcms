class AdminUser < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  # standard validation stuff
  validates :name, 
    :uniqueness => true, 
    :presence => true, 
    :format => {
      :with => /\A[a-z _]+\Z/, 
      :message => "must only include lower case letters.", 
      # passes current instance into block, if evaluates to true then format block validation occurs
      :if => Proc.new {|au| au.email == "joe@example.com"}
    }

  # validate using a custom method
  validate :name, :only_lower_case

  mount_uploader :avatar, AvatarUploader

  private
    # custom validation method
    def only_lower_case
      if self.name =~ /\A[a-z _]\Z/
        self.errors.add(:name, "can only be lower case.")
      end
    end 

end
