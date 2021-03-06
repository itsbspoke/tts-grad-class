if ENV['RACK_ENV'] == 'development'
  worker_processes 1
  listen "/opt/boxen/data/project-sockets/startcharlotte", :backlog => 1024
  timeout 120
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
