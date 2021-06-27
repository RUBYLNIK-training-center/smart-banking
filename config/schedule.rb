env :PATH, ENV['PATH']

every 1.hour do
    rake 'rates:parse'    
end
