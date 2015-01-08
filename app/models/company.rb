class Company < ActiveRecord::Base
  has_many :agent_associations
  has_many :users, through: :agent_associations
  has_many :positions


  def self.search(search)
    if search
      # this gets only users with company associations
      joins(:agent_associations).where('companies.name LIKE ?', "%#{search}%").includes(:agent_associations)
    else
      joins(:agent_associations).includes(:agent_associations)
    end
  end

end
