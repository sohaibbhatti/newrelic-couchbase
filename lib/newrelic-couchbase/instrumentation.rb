require 'new_relic/agent/method_tracer'

DependencyDetection.defer do
  @name = :couchbase

  depends_on do
    defined?(::Couchbase) &&
      !::NewRelic::Control.instance['disable_couchbase'] &&
      !ENV['DISABLE_NEW_RELIC_COUCHBASE']
  end

  executes do
    NewRelic::Agent.logger.debug 'Installing CouchBase Instrumentation'
  end

  executes do
    Dir.glob("#{File.dirname(__FILE__)}/instrumentation/*.rb") {|file| require file }
  end
end
