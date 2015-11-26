require 'faker'

Url.create(long_url: Faker::Internet.url('bbc.com'), short_url: SecureRandom.hex(3))
Url.create(long_url: Faker::Internet.url('google.com'), short_url: SecureRandom.hex(3))
Url.create(long_url: 'random.com', short_url: 'asi20o')