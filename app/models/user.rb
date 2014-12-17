class User < ActiveRecord::Base
  #has_many :languages
  belongs_to :language_prof
end
