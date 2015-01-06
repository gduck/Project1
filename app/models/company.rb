class Company < ActiveRecord::Base
  has_many :agent_associations
  has_many :users, through: :agent_associations

end
