module CouponDuniya
  class Stores
    def initialize(credentials)
      @credentials = credentials
      @page_number = 0
    end

    def all(first_letter = nil)
      querry_string = ""
      querry = {}

      unless first_letter.nil?
        querry_string = "?first_letter=#{first_letter}"
        querry = {
          first_letter: first_letter
        }
      end
      
      headers = HeadersConstructor.new(@credentials, querry_string).construct

      HTTParty.get(end_point, headers: headers, querry: querry)
    end

    private

    def end_point
      "https://api.coupondunia.in/stores"
    end
  end
end