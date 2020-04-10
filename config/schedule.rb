# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
set :environment, :development
set :output, { :error => 'log/whenever.log', :standard => 'log/cron.log' }
every 3.minutes do
  runner "Scraping.saveinfo"
end

# Learn more: http://github.com/javan/whenever