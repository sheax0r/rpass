# Rpass

RPass is a Reasonable interface to LastPass. It provides an interactive shell that can
be used to display information about accounts, along with indexes to allow you to easily copy or
display the account passwords. The indexing is in the style of [sack](https://github.com/sampson-chen/sack).

RPass is built using: 
  * [CLI-Console](https://github.com/davispuh/CLI-Console), 
  * [Highline](https://github.com/JEG2/highline)
  * [lastpass-ruby](https://github.com/detunized/lastpass-ruby)
  * [clamp](https://github.com/mdub/clamp)
  * [colorize](https://github.com/fazibear/colorize)

Currently, RPass is read-only. I would like to extend it to support saving passwords, and maybe 
other LastPass features in future.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rpass'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rpass

## Usage

```bash
# Launch the interactive shell. This will ask for your username, password and 2fa.
rpass

# This will print out all accounts with any field (other than password) that matches the string "gmail".
# You can use any valid regular expression for the parameter to "ls".
rpass> ls gmail

# This will copy the given matched account from the last output of "ls". Indexing starts at zero.
rpass> cp 1

# This will print out the given matched account from th elast output of "ls".
rpass> show 1
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rpass.

