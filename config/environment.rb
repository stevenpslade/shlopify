# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Logger setup
Rails.logger = Logger.new(STDOUT)
Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"
