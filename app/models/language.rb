class Language < ActiveRecord::Base
  has_and_belongs_to_many :language_prof
end
