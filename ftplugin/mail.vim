if line('$') > 1
  :1
  :put! =\"\n\n\"
  :1
endif

execute 'startinsert'
