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

  def total
    items.inject(0){ |n, i| n + i.total }
  end

  def total_after_tax
    items.inject(0){ |n, i| n + i.total_after_tax }
  end

  scope :open, -> { where(:phase => 'open') }
end
