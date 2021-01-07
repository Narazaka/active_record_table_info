# ActiveRecordTableInfo

[![Actions Status](https://github.com/Narazaka/active_record_table_info/workflows/Ruby/badge.svg)](https://github.com/Narazaka/active_record_table_info/actions)
[![Gem Version](https://badge.fury.io/rb/active_record_table_info.svg)](https://badge.fury.io/rb/active_record_table_info)

`User.table_info` shows columns and indexes like `SHOW CREATE TABLE`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record_table_info'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_record_table_info

## Usage

```ruby
class ApplicationRecord < ActiveRecord::Base
  extend ActiveRecordTableInfo
end
```

then

```
User.table_info
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_record_table_info.

## License

[Zlib](LICENSE)
