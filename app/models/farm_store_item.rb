class FarmStoreItem < ActiveRecord::Base
  validates :name, :presence => true
  validates :pricing, :presence => true

  serialize :pricing, Hash

  def tax_rate
    #expects this to be constant to be defined
    read_attribute
    FARM_STORE_TAX_RATE
  end
end
