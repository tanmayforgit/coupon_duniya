module CouponDuniya
  module Api
    class Stores
      def initialize(credentials)
        @credentials = credentials
        @page_number = 0
      end

      def all(first_letter = nil)
        querry_string = ""
        querry = {}

        unless first_letter.nil?
          querry_string = "first_letter=#{first_letter}"
          querry = {
            first_letter: first_letter
          }
        end
        
        headers = HeadersConstructor.new(@credentials, querry_string).construct
        HTTParty.get(httparty_url(querry_string), headers: headers, querry: querry)
      end

      private

      def httparty_url(querry_string)
        url = "https://api.coupondunia.in/stores"
        unless querry_string.empty?
          url = "#{url}?#{querry_string}"
        end

        url
      end
    end
  end
end