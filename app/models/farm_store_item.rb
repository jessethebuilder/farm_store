class FarmStoreItem < ActiveRecord::Base
  validates :name, :presence => true
  validates :pricing, :presence => true

  serialize :pricing, Hash

end
