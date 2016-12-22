module CouponDuniya
	class Credentials
		attr_reader :partner_id, :api_key
		def initialize(partner_id, api_key)
			@partner_id = partner_id.to_s
			@api_key = api_key.to_s
		end
	end
end