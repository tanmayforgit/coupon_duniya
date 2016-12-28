module CouponDuniya
  module Api
    class Stores
      def initialize
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
        
        headers = HeadersConstructor.new(querry_string).construct
        url = "https://api.coupondunia.in/stores"
        HTTParty.get(httparty_url(url,querry_string), headers: headers, querry: querry)["stores"]
      end     

      private

      def httparty_url(url,querry_string)       
        unless querry_string.empty?
          url = "#{url}?#{querry_string}"
        end

        url
      end
    end
  end
end