# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
secret = ENV['RAILS_SECRET_TOKEN']
if secret.nil? || secret.length < 30
  # MUST CHANGE!!
  secret = "7b02b842f8d882f929984c9ea2ef4ce3765b5794245f8ea4bfd9e8292fbd1c87ac2372a8508f9531a389964c8db88a0583dd45375b376f4bb00a888fc4df6cd6"
end
Tinyclone2::Application.config.secret_token = secret
