env :PATH, ENV['PATH']

every 1.minute do
    rake 'rates:parse'    
end
