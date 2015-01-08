class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :language_profs, :dependent => :destroy
  has_many :languages, through: :language_profs
  has_many :prof_categories, through: :language_profs
  has_many :agent_associations
  has_many :companies, through: :agent_associations

  accepts_nested_attributes_for :language_profs, :allow_destroy => true
  accepts_nested_attributes_for :agent_associations, :allow_destroy => true
  accepts_nested_attributes_for :companies, :allow_destroy => false

  def self.search(search)
    if search
      joins(:language_profs).joins(:languages).where('(users.first_name || languages.name) LIKE ?', "%#{search}%").includes(:language_profs)
    else
      # limit to 5 for the front page, most recent
      order(created_at: :desc).joins(:language_profs).includes(:language_profs).limit(5)
    end
  end
end

