class LangProfReq < ActiveRecord::Base
  belongs_to :position
  belongs_to :language
  belongs_to :prof_category
end
