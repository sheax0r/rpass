require 'rpass/storage'

module RPass

  def self.cache
    @cache ||= Cache.new(RPass.storage)
  end

  class Cache
    CACHE_KEY = ".cache"

    attr_reader :storage

    def initialize(storage)
      @storage = storage
    end

    def write(name, value, duration: 0)
      storage.write(name, value)
      map = data
      data[name] = Time.now + duration
      storage.write(CACHE_KEY, data)
    end

    def read(name)
      map = data
      if !data[name] || Time.now < data[name]
        storage.read(name)
      else
        storage.delete(name)
        nil
      end
    end

    def data
      YAML.load(storage.read(CACHE_KEY))
    end
  end
end
