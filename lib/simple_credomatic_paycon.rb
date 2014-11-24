require "simple_credomatic_paycon/version"
require "simple_credomatic_paycon/configuration"
require "simple_credomatic_paycon/transaction"

begin
  require "pry"
rescue LoadError
end


module SimpleCredomaticPaycon

  class << self
    attr_accessor :configuration

    # def configure
    # end

  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end
