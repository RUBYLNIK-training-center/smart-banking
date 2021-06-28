env :PATH, ENV['PATH']

job_type :rake,    "cd :path && :environment_variable=:environment bundle exec /home/deploy/.rbenv/shims/rake  :task --silent :output"

every 1.hour do
    rake 'rates:parse'    
end
