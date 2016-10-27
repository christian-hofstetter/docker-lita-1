require 'bundler'
load 'lita_env.rb'

Bundler.require(:default, Lita::env)
Dotenv.load

Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Lita"
  
  config.robot.mention_name = "RaceBot"

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  if Lita::env?(:production)
    # The adapter you want to connect with. Make sure you've added the
    # appropriate gem to the Gemfile.
      config.robot.adapter = :hipchat
      config.adapters.hipchat.jid = "1_1172@chat.btf.hipchat.com"
      config.adapters.hipchat.password = "asdf"
  end

  config.redis.host = ENV["REDIS_HOST"] || "redis"
  config.redis.port = (ENV["REDIS_PORT"] || "6379").to_i

  config.handlers.factoid_handler.chance = 0.3
  config.handlers.karma.link_karma_threshold = nil
end
