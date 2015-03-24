class FarmStoreProfile < ActiveRecord::Base
  belongs_to :has_farm_store_profile, polymorphic: true

  validates :standard_tax_rate, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
end
