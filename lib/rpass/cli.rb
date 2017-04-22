require "clamp"
require "lastpass"
require "rpass/ls"
require "rpass/show"

module RPass
  class CLI < Clamp::Command
    subcommand "ls", "List items in lastpass", RPass::LS
    subcommand "show", "Show a value from lastpass", RPass::Show

    def execute
    end
  end
end


