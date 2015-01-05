class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  has_many :language_profs, :dependent => :destroy
  has_many :languages, through: :language_profs
  has_many :prof_categories, through: :language_profs

  accepts_nested_attributes_for :language_profs, :allow_destroy => true

  def self.search(search)
    if search
      #find(:all, :conditions => ['language.name LIKE ?', "%#{search}%"])
      joins(:language_profs).joins(:languages).where('languages.name LIKE ?', "%#{search}%").includes(:language_profs)
    else
      #scoped
      # only users with some language proficiency needed
      # limit to 5 for the front page, most recent
      order(created_at: :desc).joins(:language_profs).includes(:language_profs).limit(5)
    end
  end
end

