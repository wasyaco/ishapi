ENV["RAILS_ENV"] ||= 'test'
# require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
require File.expand_path("../../config/environment.rb", __FILE__)
require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.include Devise::TestHelpers, :type => :helper
  config.include Devise::TestHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :controller

end

=begin
class UserStub
  def initialize args = {}
    @profile = OpenStruct.new
    if args[:manager]
      @profile[:manager?] = true
    end
  end

  def profile= profile
    @profile = profile
  end

  def profile
    return @profile
  end
end
=end

# require_relative './factories'

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

class UserStub
  def initialize args = {}
    @profile = OpenStruct.new
    if args[:manager]
      @profile[:manager?] = true
    end
  end

  def profile= profile
    @profile = profile
  end

  def profile
    return @profile
  end
end
