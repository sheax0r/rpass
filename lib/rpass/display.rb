require "colorize"

module RPass
  class Display
    def render_account(account, index)
      <<-EOF
#{title(account, index)}
  - id: #{account.id}
  - username: #{account.username}
  - url: #{account.url}
  - group: #{account.group}
      EOF
    end

    def title(account, index)
      "[#{index}] - #{account.name}:".green
    end
  end
end
