module CouponDuniya
  module Api
    class Offers
      def initialize
        @page_number = 0
      end

      def best_twenty
        querry_string = ""
        querry = {}

        httparty_url = "https://api.coupondunia.in/best-offers"
        headers = HeadersConstructor.new(querry_string).construct
        HTTParty.get(httparty_url, headers: headers, querry: querry)
      end
    end
  end
end