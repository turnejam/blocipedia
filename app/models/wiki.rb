class Wiki < ApplicationRecord
  belongs_to :user, required: false
end
