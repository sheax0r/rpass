require "fileutils"

module RPass

  def self.storage
    @storage ||= Storage.new("#{ENV["HOME"]}/.rpass")
  end

  class Storage
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def write(name, value)
      File.write(file(name), value)
    end

    def delete(name)
      File.delete(file(name))
    end

    def exists?(name)
      File.exists?(file(name))
    end

    def read(name)
      exists?(name) ?  File.read(file(name)) : nil
    end

    def [](name)
      read(name)
    end

    def []=(name, value)
      write(name, value)
    end

    private

    def file(name)
      "#{dir}/#{name}"
    end

    def dir
      @dir ||= path.tap do |path|
        FileUtils.mkdir_p path
      end
    end
  end
end
