require 'new_relic/agent/method_tracer'

DependencyDetection.defer do
  @name = :couchbase

  depends_on do
    defined?(::Couchbase) &&
      !::NewRelic::Control.instance['disable_couchbase'] &&
      !ENV['DISABLE_NEW_RELIC_couchbase']
  end

  executes do
    NewRelic::Agent.logger.debug 'Installing CouchBase Instrumentation'
  end

  executes do
    ::Couchbase.module_eval do
      class << self
        include NewRelic::Agent::MethodTracer
        add_method_tracer :connect, 'Couchbase/Bucket/connect'
        add_method_tracer :new,     'Couchbase/Bucket/connect'
        add_method_tracer :bucket,  'Couchbase/Bucket/bucket'
      end
    end

    ::Couchbase::Bucket.class_eval do
      include NewRelic::Agent::MethodTracer
      add_method_tracer :set,                'Couchbase/Bucket/set'
      add_method_tracer :get,                'Couchbase/Bucket/get'
      add_method_tracer :incr,               'Couchbase/Bucket/incr'
    end
  end
end
