class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email

  validates_uniqueness_of :username
  validates_presence_of :username

  def to_s
    username
  end
end
