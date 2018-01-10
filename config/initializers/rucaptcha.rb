RuCaptcha.configure do
  # Number of chars, default: 4
  self.length = 4
  # Image font size, default: 45
  # self.font_size = 45
  # Cache generated images in file store, this is config files limit, default: 100
  # set 0 to disable file cache.
  # self.cache_limit = 100
  # [:null_store, :memory_store, :file_store]
  self.cache_store = :redis_store
  # Custom captcha code expire time if you need, default: 2 minutes
  # self.expires_in = 120
  # Color style, default: :colorful, allows: [:colorful, :black_white]
  # self.style = :colorful
end