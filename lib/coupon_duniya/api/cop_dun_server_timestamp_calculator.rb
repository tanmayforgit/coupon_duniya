require 'httparty'
module CouponDuniya
  module Api
  	module CopDunServerTimestampCalculator
  		def coupon_duniya_server_timestamp
  		  HTTParty.get('https://api.coupondunia.in/timestamp').parsed_response['timestamp'].to_s
  		end
  	end
  end
end
