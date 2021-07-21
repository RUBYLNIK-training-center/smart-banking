server '95.181.152.190', user: 'deploy', roles: %w{app db web}

after 'deploy', 'whenever:update_crontab'