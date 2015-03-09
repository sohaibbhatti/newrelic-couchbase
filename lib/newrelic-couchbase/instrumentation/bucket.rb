::Couchbase::Bucket.class_eval do
  include NewRelic::Agent::MethodTracer

  # https://code.google.com/p/memcached/wiki/BinaryProtocolRevamped#Introduction
  [
    :get,
    :set,
    :add,
    :replace,
    :delete,
    :increment,
    :decrement,
    :flush,
    :append,
    :prepend,
    :touch,
    :stats,
    :run
  ].each do |instruction|
    add_method_tracer instruction, "Couchbase/Bucket/#{instruction.to_s}"
  end

  add_method_tracer :incr, "Couchbase/Bucket/increment"
  add_method_tracer :decr, "Couchbase/Bucket/decrement"

  add_method_tracer :cas,                   'Couchbase/Bucket/compare_and_swap'
  add_method_tracer :compare_and_swap,      'Couchbase/Bucket/compare_and_swap'
  add_method_tracer :design_docs,           'Couchbase/Bucket/design_docs'
  add_method_tracer :save_design_doc,       'Couchbase/Bucket/save_design_doc'
  add_method_tracer :delete_design_doc,     'Couchbase/Bucket/delete_design_doc'
  add_method_tracer :observe_and_wait,      'Couchbase/Bucket/observe_and_wait'
  add_method_tracer :create_timer,          'Couchbase/Bucket/create_timer'
  add_method_tracer :create_periodic_timer, 'Couchbase/Bucket/create_perioidic_timer'
end
