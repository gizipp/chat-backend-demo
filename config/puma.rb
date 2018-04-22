workers_count = ENV.fetch("WEB_CONCURRENCY") { 1 }
threads_count = ENV.fetch("MAX_THREADS") { 5 }

threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 4567
environment ENV['RACK_ENV'] || 'development'
