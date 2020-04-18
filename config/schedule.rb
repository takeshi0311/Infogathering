# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
# set :environment, :development
# set :environment, :production
set :output, { :error => 'log/whenever.log', :standard => 'log/cron.log' }

every 3.hours do
  runner "Scraping.saveinfo"
end

every 3.hours do
  runner "Scraping.developers"
end

every 3.hours do
  runner "Scraping.cybozu"
end
# Learn more: http://github.com/javan/whenever
