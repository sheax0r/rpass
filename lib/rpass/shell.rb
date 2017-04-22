require "cli-console"
require "pbcopy"
require "rpass/display"

module RPass
  class Shell
    private

    extend CLI::Task

    attr_accessor:accounts, :matches, :display

    public

    def initialize(accounts, display: Display.new)
      @accounts = accounts
      @matches = nil
      @display = display
    end

    def ls(args)
      string = args.size == 0 ? "." : args.first
      reset_matches
      i = 0
      matched_accounts(string).each do |account|
        puts display.render_account(account, i)
        puts
        i += 1
      end
    end

    def cp(args)
      pbcopy < get_match(args[0]).password
    end

    def print(args)
      puts get_match(args[0]).password
    end

    def get_match(index)
      index = index.to_i
      fail "No matched accounts" unless matches
      fail "No such index: #{index}" if index < 0 || index > matches.size - 1
      matches[index]
    end

    def reset_matches
      @matches = nil
    end

    def matched_accounts(string)
      @matches ||= find_matches(string)
    end

    def find_matches(string)
      accounts.select do |account|
        matched = false
        %i{id name username password url group}.each do |method|
          matched ||= account.send(method).to_s =~ /#{string}/
          break if matched
        end
        matched
      end
    end

    def prompt
      "rpass"
    end
  end
end
