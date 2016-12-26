module CouponDuniya
  class Configuration
    attr_accessor :api_key
    attr_reader :partner_id
    def initialize
      @partner_id = nil
      @api_key = nil
    end

    def partner_id=(partner_id)
      @partner_id = partner_id.to_s
    end

    def valid?
      !@partner_id.nil? && !@api_key.nil?
    end
  end
end