class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :wiki_collaborations, through: :collaborators, source: :wiki

  after_initialize { self.role ||= :member }

  enum role: [:member, :premium, :admin]

  def downgrade_wikis
    self.wikis.each do |wiki|
      wiki.make_public
    end
  end
end
