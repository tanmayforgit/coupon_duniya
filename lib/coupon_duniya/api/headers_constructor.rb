require_relative './cop_dun_server_timestamp_calculator'
module CouponDuniya
  module Api
    class HeadersConstructor
      include CouponDuniya::Api::CopDunServerTimestampCalculator
      def initialize(credentials, querry_string)
        @credentials = credentials
        @querry_string = querry_string
        @hitting_timestamp = coupon_duniya_server_timestamp
      end

      def construct
        {
          'Authorization' => 'Basic ' + base64_encode_checksum,
          'X-Requested-By' => partner_id,
          'X-Request-Timestamp' => @hitting_timestamp
        }
      end

      private

      def api_key
        @credentials.api_key
      end

      def partner_id
        @credentials.partner_id
      end

      def base64_encode_checksum
        Base64.encode64(checksum).strip
      end

      def checksum
        "#{Digest::MD5.hexdigest(md5_calculation_string)}:"
      end

      def md5_calculation_string
        "#{partner_id}#{@hitting_timestamp}#{api_key}#{@querry_string}"
      end
    end
  end
end