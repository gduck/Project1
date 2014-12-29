class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  has_many :language_profs, :dependent => :destroy
  has_many :languages, through: :language_profs
  has_many :prof_categories, through: :language_profs


  accepts_nested_attributes_for :language_profs, :allow_destroy => true

end
