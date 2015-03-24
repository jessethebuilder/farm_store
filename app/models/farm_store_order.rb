class FarmStoreOrder < ActiveRecord::Base
  belongs_to :makes_orders, polymorphic: true
  has_many :farm_store_order_items

  validates :phase, presence: true, inclusion: {:in => %w|open completed sent delivered returned|}

  # serialize :items, Array
  #addresses are saved as whatever you want
  serialize :billing_address, JSON
  serialize :shipping_address, JSON

  after_initialize do
    self.phase ||= 'open'
    # self.items = [] if self.new_record?
  end

  # def items
  #   farm_store_order_items
  # end

  def total
    farm_store_order_items.inject(0){ |n, i| n + i.total }
  end

  def total_after_tax
    farm_store_order_items.inject(0){ |n, i| n + i.total_after_tax }
  end

  scope :open, -> { where(:phase => 'open') }
end
