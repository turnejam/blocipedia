class Wiki < ApplicationRecord
  belongs_to :user, required: false

  def make_public
    update_attribute(:private, false)
  end
end
