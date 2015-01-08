class Position < ActiveRecord::Base
  belongs_to :company
  has_many :lang_prof_reqs

  def self.search(search)
    if search
      joins(:company).where('(positions.name || companies.name) LIKE ?', "%#{search}%").includes(:company)
    else
      order(created_at: :desc)
    end
  end
end
