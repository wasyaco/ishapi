
require 'rack/throttle'

module Ishapi
  class Engine < ::Rails::Engine
    isolate_namespace Ishapi
    # config.middleware.use Rack::Throttle::Interval, :min => 1.0, :max => 10
  end
end
