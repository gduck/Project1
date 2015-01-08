class Language < ActiveRecord::Base
  has_many :language_profs
  has_many :users, through: :language_profs
  has_many :prof_categories, through: :language_profs, through: :users

  has_many :lang_prof_reqs

end
