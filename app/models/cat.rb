class Cat < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :matching, -> (q) do
    where "name ilike :q or caption ilike :q", q: "%#{q}%"
  end

  def to_s
    name
  end
end
