module CouponDuniya
  module Api
    class Offers
      def initialize
        @page_number = 0
      end

      def self.for_category(category)
        querry_string = ""
        querry = {}

        httparty_url = "https://api.coupondunia.in/categories/#{category.id}/offers"
        headers = HeadersConstructor.new(querry_string).construct
        HTTParty.get(httparty_url, headers: headers, querry: querry)["offers"]
      end

      def self.for_store(store)
        querry_string = ""
        querry = {}

        headers = HeadersConstructor.new(querry_string).construct
        httparty_url = "https://api.coupondunia.in/stores/#{store.id}/offers"
        HTTParty.get(httparty_url, headers: headers, querry: querry)["offers"]
      end

      def best_twenty
        querry_string = ""
        querry = {}

        httparty_url = "https://api.coupondunia.in/best-offers"
        headers = HeadersConstructor.new(querry_string).construct
        HTTParty.get(httparty_url, headers: headers, querry: querry)["offers"]
      end

    end
  end
end