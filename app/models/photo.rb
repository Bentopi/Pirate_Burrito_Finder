class Photo < ActiveRecord::Base
  belongs_to :treasuremap
  attachment :attachment
end
