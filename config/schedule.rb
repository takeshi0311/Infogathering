# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
# set :environment, :development
set :output, { :error => 'log/whenever.log', :standard => 'log/cron.log' }

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env

every 3.minutes do
  runner "Scraping.saveinfo"
end

every 3.minutes do
  runner "Scraping.developers"
end

every 3.minutes do
  runner "Scraping.cybozu"
end
# Learn more: http://github.com/javan/whenever
