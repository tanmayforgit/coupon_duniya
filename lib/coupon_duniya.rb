require "coupon_duniya/version"
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
