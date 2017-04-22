require "clamp"
require "lastpass"
require "rpass/shell_command"

module RPass
  class CLI < Clamp::Command
    self.default_subcommand = "shell"

    subcommand "shell", "Interactive shell", RPass::ShellCommand
  end
end


