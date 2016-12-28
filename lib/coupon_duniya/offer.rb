module CouponDuniya
  class Offer
    attr_reader :public_id,:title,:expires_on,:description,:terms,:uses_today,:added_on,:verified_on,:coupon_code,:mobile_cashback_prefix,:name,:share_url,:is_deal,:outlink_url,:success_rate,:tags,:store,:category
    def initialize(public_id, title, expires_on, description, terms, uses_today, added_on, verified_on, coupon_code, mobile_cashback_prefix, name, share_url, is_deal, outlink_url, success_rate, tags, store, category)
      @public_id = public_id
      @title = title
      @expires_on = expires_on
      @description = description
      @terms = terms
      @uses_today = uses_today
      @added_on = added_on
      @verified_on = verified_on
      @coupon_code = coupon_code
      @mobile_cashback_prefix = mobile_cashback_prefix
      @name = name
      @share_url = share_url
      @is_deal = is_deal
      @outlink_url = outlink_url
      @success_rate = success_rate
      @tags = tags
      @store = store
      @category = category
    end

   def self.best_twenty
      raise CouponDuniya::NotConfiguredError unless CouponDuniya::configuration.valid?

      api_response = Api::Offers.new.best_twenty
      create_from_cd_api_response(api_response)
    end

    def self.create_from_cd_api_response(api_response)
      api_response.each_with_object([]) do |offer_object_as_hash, offfers|
        store_object_as_hash = offer_object_as_hash['store']
        category_object_as_hash = offer_object_as_hash['category']
        store = CouponDuniya::Store.new(
            store_object_as_hash['store_id'],
            store_object_as_hash['name'],
            store_object_as_hash['logo_rectangle_url'],
            store_object_as_hash['logo_square_url'],
            store_object_as_hash['num_offers']
          )

        category = CouponDuniya::Category.new(
            category_object_as_hash['category_id'],
            category_object_as_hash['category_name'],
            category_object_as_hash['icon_url'],
            category_object_as_hash['num_offers']
          )

        offfers << new(
          offer_object_as_hash["public_id"],
          offer_object_as_hash["title"],
          offer_object_as_hash["expires_on"],
          offer_object_as_hash["description"],
          offer_object_as_hash["terms"],
          offer_object_as_hash["uses_today"],
          offer_object_as_hash["added_on"],
          offer_object_as_hash["verified_on"],
          offer_object_as_hash["coupon_code"],
          offer_object_as_hash["mobile_cashback_prefix"],
          offer_object_as_hash["name"],
          offer_object_as_hash["share_url"],
          offer_object_as_hash["is_deal"],
          offer_object_as_hash["outlink_url"],
          offer_object_as_hash["success_rate"],
          offer_object_as_hash["tags"],
          store,
          category
          )
      end
    end
  end
end