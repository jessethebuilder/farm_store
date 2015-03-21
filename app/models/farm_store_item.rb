class FarmStoreItem < ActiveRecord::Base
  validates :name, :presence => true
  validates :pricing, :presence => true

  serialize :pricing, Hash

  def tax_rate
    rate = read_attribute(:tax_rate) || farm_store_standard_tax_rate
    rate * 0.01
  end
end
