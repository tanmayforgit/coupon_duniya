module CouponDuniya
  module Api
    class Categories
      def initialize
        @page_number = 0
      end

      def all
        querry_string = ""
        headers = HeadersConstructor.new(querry_string).construct
        HTTParty.get(httparty_url, headers: headers)
      end

      private

      def httparty_url
        "https://api.coupondunia.in/categories"
      end
    end
  end
end