class FarmStoreOrder < ActiveRecord::Base
  belongs_to :makes_orders, polymorphic: true

  validates :phase, presence: true, inclusion: {:in => %w|open completed sent delivered returned|}

  serialize :items, Array
  #addresses are saved as whatever you want
  serialize :billing_address, JSON
  serialize :shipping_address, JSON

  after_initialize do
    self.phase ||= 'open'
  end

  def store
    #at some point, this may change, but for now, it relies on a single Store record to exist in the db

  end


end
