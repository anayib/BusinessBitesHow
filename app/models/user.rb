# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :integer
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  name                   :string
#  stripe_customer_id     :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :content_manager, :admin, :vip_user]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://i592.photobucket.com/albums/tt5/Mardini03/765-default-avatar.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  after_initialize :set_default_role, :if => :new_record?
  has_many :topic_completitions, dependent: :destroy
  has_many :topics, through: :topic_completitions, dependent: :destroy
  has_one :subscription, dependent: :destroy
  after_create :welcome_email

  def set_default_role
    self.role ||= :user
  end

  # Override devise confirm! message
  def confirm!
    welcome_email
    super
  end

  def self.welcome_subscriptor_email(user)
    UserMailer.welcome_email(user).deliver
  end

  protected
    def confirmation_required?
      false
    end

  private
    def welcome_email
      UserMailer.welcome_email(self).deliver
    end
end
