server '45.138.72.169', user: 'deploy', roles: %w{app db web}

after 'deploy', 'whenever:update_crontab'