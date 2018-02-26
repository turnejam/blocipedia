class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  after_initialize { self.role ||= :member }

  enum role: [:member, :admin, :premium]

  def downgrade_wikis
    self.wikis.each do |wiki|
      wiki.make_public
    end
  end
end
