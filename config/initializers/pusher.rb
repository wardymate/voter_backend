# config/initializers/pusher.rb
require 'pusher'

pusher_key = ENV['PUSHER_KEY']
pusher_secret = ENV['PUSHER_SECRET']
Pusher.url = "https://#{pusher_key}:#{pusher_secret}@api.pusherapp.com/apps/157859"
Pusher.logger = Rails.logger
