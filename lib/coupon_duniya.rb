require "coupon_duniya/version"
require "coupon_duniya/offer"
require "coupon_duniya/api/offers"
require "coupon_duniya/configuration"
require "coupon_duniya/api/headers_constructor"
 
Dir[File.expand_path "lib/**/*.rb"].each{|f| require_relative(f)}

module CouponDuniya
  # Your code goes here...

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class NotConfiguredError < StandardError
    
  end
end
