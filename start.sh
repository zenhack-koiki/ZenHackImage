PID=`ps auxf | grep unicorn | grep -v grep | head -n 1 | awk '{ print $2 }'`
if [ -n "$PID" ]; then
  kill -9 $PID
  echo "Killed unicorn process ${PID}"
else
  echo "Couldn't find unicorn process."
fi

bundle exec rake assets:precompile RAILS_ENV=production

SECRET_KEY_BASE=`bundle exec rake secret`

export SECRET_KEY_BASE

bundle exec unicorn_rails -c config/unicorn.rb -E production -D

PID=`ps auxf | grep unicorn | grep -v grep | head -n 1 | awk '{ print $2 }'`

echo "Started unicorn process ${PID}"
