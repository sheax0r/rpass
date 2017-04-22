require "cli-console"
require "highline"
require "rpass/vault_provider"
require "rpass/shell"

module RPass
  class ShellCommand < Clamp::Command
    def execute
      io = HighLine.new
      shell = Shell.new(all_accounts)
      console = ::CLI::Console.new(io)
      console.addCommand("ls", shell.method(:ls), "List lastpass entries.")
      console.addCommand("print", shell.method(:print), "Print password for the specified entry, by number.")
      console.addCommand("cp", shell.method(:cp), "Copy password for the specified entry to clipboard.")
      console.addExitCommand('quit', 'Quit')
      console.start("%s> ", [shell.method(:prompt)])
    end

    def all_accounts
      RPass.vault.accounts
    end
  end
end
