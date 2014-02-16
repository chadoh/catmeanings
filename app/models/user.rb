class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  def to_s
    email
  end
end
