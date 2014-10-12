# Ruboty::Gen

generators for creating ruboty plugin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-gen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-gen

## Usage

```
  ∩ ∩  ∠ i’m at ~/src/github.com/blockgiven
( ╹x╹) ruboty-gen gem yo
      create  ruboty-yo/Gemfile
      create  ruboty-yo/Rakefile
      create  ruboty-yo/LICENSE.txt
      create  ruboty-yo/README.md
      create  ruboty-yo/.gitignore
      create  ruboty-yo/ruboty-yo.gemspec
      create  ruboty-yo/lib/ruboty/yo.rb
      create  ruboty-yo/lib/ruboty/yo/version.rb
Initializing git repo in /Users/block_given/src/github.com/blockgiven/ruboty-yo
      create  ruboty-yo/lib/ruboty/handlers/yo.rb
      create  ruboty-yo/lib/ruboty/yo/actions/yo.rb
  ∩ ∩  ∠ i’m at ~/src/github.com/blockgiven
( ╹x╹) cd ruboty-yo
  ∩ ∩  ∠ i’m at ~/src/github.com/blockgiven/ruboty-yo [master] ✗
( ╹x╹) tree
.
├── Gemfile
├── LICENSE.txt
├── README.md
├── Rakefile
├── lib
│   └── ruboty
│       ├── handlers
│       │   └── yo.rb
│       ├── yo
│       │   ├── actions
│       │   │   └── yo.rb
│       │   └── version.rb
│       └── yo.rb
└── ruboty-yo.gemspec

5 directories, 9 files
```
    

## Contributing

1. Fork it ( https://github.com/blockgiven/ruboty-gen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
