class Cat < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def to_s
    name
  end
end
