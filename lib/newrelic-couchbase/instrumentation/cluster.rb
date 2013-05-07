::Couchbase::Cluster.class_eval do
  include NewRelic::Agent::MethodTracer

  [:create_bucket, :delete_bucket].each do |instruction|
    add_method_tracer instruction, "Couchbase/Cluster/#{instruction.to_s}"
  end
end
