require "lastpass"
require "rpass/cache"
require "highline"

module RPass

  def self.vault
    VaultProvider.new(RPass.storage).vault
  end

  class VaultProvider
    attr_reader :storage

    def initialize(storage)
      @storage = storage
    end

    def vault
      LastPass::Vault.open_remote(username, get_password, get_second_factor)
    end

    def username
      storage["username"] ||= get_username
    end

    def get_password
      cli.ask("Enter your password: "){ |q| q.echo = false }.strip
    end

    def get_second_factor
      cli.ask("Enter your second factor: ").strip
    end

    def get_username
      cli.ask("Enter your username: ").strip
    end

    def cli
      @cli ||= HighLine.new
    end
  end
end
