class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  def make_public
    update_attribute(:private, false)
  end
end
