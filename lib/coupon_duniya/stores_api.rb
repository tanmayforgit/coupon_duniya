require 'digest/md5'
require 'base64'
module CouponDuniya
	class StoresApi
		include CopDunServerTimestampCalculator

		def initialize(credentials)
			@credentials = credentials
			@hitting_timestamp = coupon_duniya_server_timestamp
		end

		def hit
			HTTParty.get(base_url,
				headers: headers)
		end

		def self.hit(credentials)
			new(credentials).hit
		end

		private

		def base_url
			"https://api.coupondunia.in/stores"
		end

		def api_key
			@credentials.api_key
		end

		def partner_id
			@credentials.partner_id
		end

		def headers
			{
				'Authorization' => 'Basic ' + base64_encode_checksum,
				'X-Requested-By' => partner_id,
				'X-Request-Timestamp' => @hitting_timestamp
			}
		end

		def base64_encode_checksum
			Base64.encode64(checksum).strip
		end

		def checksum
			"#{Digest::MD5.hexdigest(md5_calculation_string)}:"
		end

		def md5_calculation_string
			"#{partner_id}#{@hitting_timestamp}#{api_key}#{querry_string}"
		end

		def querry_string
			""
		end
	end
end