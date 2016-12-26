module CouponDuniya
  class Category
    attr_reader :id, :name, :icon_url, :number_of_offers
    def initialize(id, name, icon_url, number_of_offers)
      @id = id
      @name = name
      @icon_url = icon_url
      @number_of_offers = number_of_offers
    end

    def self.all
      raise CouponDuniya::NotConfiguredError unless CouponDuniya::configuration.valid?

      api_response = Api::Categories.new.all
      create_from_cd_api_response(api_response)
    end


    private

    def self.create_from_cd_api_response(api_response)
      api_response.each_with_object([]) do |store_object_as_hash, stores|
        stores << new(
            store_object_as_hash['category_id'],
            store_object_as_hash['category_name'],
            store_object_as_hash['icon_url'],
            store_object_as_hash['num_offers']
          )
      end
    end
  end
end