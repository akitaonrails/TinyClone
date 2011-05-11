# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
#if ENV['RAILS_ENV'] == 'production'
  use Rack::Cache,
        :verbose => true,
        :metastore   => "file:#{RAILS_ROOT}/tmp/cache/rack/meta",
        :entitystore => "file:#{RAILS_ROOT}/tmp/cache/rack/body" 
#end
run Tinyclone2::Application
