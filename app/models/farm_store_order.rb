class FarmStoreOrder < ActiveRecord::Base
  belongs_to :has_orders, polymorphic: true

  validates :phase, presence: true, inclusion: {:in => %w|open completed sent delivered returned|}

  serialize :items, JSON
  #addresses are saved as whatever you want
  serialize :billing_address, JSON
  serialize :shipping_address, JSON

  after_initialize do
    items ||= []
    phase ||= 'open'
  end
end