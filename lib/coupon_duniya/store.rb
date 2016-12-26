module CouponDuniya
  class Store
    attr_reader :id, :name, :logo_rectangle_url, :number_of_offeres
    def initialize(id, name, logo_rectangle_url, logo_square_url, number_of_offeres)
      @id = id
      @name = name
      @logo_rectangle_url = logo_rectangle_url
      @number_of_offeres = number_of_offeres
    end

    def self.all(first_letter = nil)
      raise CouponDuniya::NotConfiguredError unless CouponDuniya::configuration.valid?

      api_response = Api::Stores.new.all(first_letter)
      create_from_cd_api_response(api_response)
    end


    private

    def self.create_from_cd_api_response(api_response)
      api_response.each_with_object([]) do |store_object_as_hash, stores|
        stores << new(
            store_object_as_hash['store_id'],
            store_object_as_hash['store_name'],
            store_object_as_hash['logo_rectangle_url'],
            store_object_as_hash['logo_square_url'],
            store_object_as_hash['num_offers']
          )
      end
    end
  end
end