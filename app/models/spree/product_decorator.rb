Spree::Product.class_eval do
  # has_many :bus_bookings, dependent: :destroy 
  # validates :child_price, presence: true
  # delegate_belongs_to :child_price
  # 
  # has_many :child_prices, -> { order('spree_variants.position, spree_variants.id, currency') }, through: :variants
  
  # private
  # # Builds variants from a hash of option types & values
  # def build_variants_from_option_values_hash
  #   ensure_option_types_exist_for_values_hash
  #   values = option_values_hash.values
  #   values = values.inject(values.shift) { |memo, value| memo.product(value).map(&:flatten) }
  # 
  #   values.each do |ids|
  #     variant = variants.create(
  #       option_value_ids: ids,
  #       price: master.price
  #       
  #     )
  #   end
  #   save
  # end
end

