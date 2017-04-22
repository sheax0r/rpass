require "rpass/vault_provider"

module RPass
  class LS < Clamp::Command
    def execute
      RPass.vault.accounts.each do |account|
        puts account.name
      end
    end
  end
end
