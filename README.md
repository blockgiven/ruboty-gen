# Ruboty::Gen

generators for creating ruboty plugin.
[![Gem Version](https://badge.fury.io/rb/ruboty-gen.svg)](http://badge.fury.io/rb/ruboty-gen)

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
( ╹x╹) ruboty-gen gem yo action1 action2
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
      create  ruboty-yo/lib/ruboty/yo/actions/action1.rb
      create  ruboty-yo/lib/ruboty/yo/actions/action2.rb
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
│       │   │   ├── action1.rb
│       │   │   └── action2.rb
│       │   └── version.rb
│       └── yo.rb
└── ruboty-yo.gemspec

5 directories, 10 files
```

* ./lib/ruboty/yo.rb (generated code)

~~~ruby
require "ruboty/yo/version"
require "ruboty/handlers/yo"

module Ruboty
  module Yo
    # Your code goes here...
  end
end
~~~

* ./lib/ruboty/handlers/yo.rb (generated code)

~~~ruby
require "ruboty/yo/actions/action1"
require "ruboty/yo/actions/action2"

module Ruboty
  module Handlers
    class Yo < Base
      on /yo action1/, name: 'action1', description: 'TODO: write your description'
      on /yo action2/, name: 'action2', description: 'TODO: write your description'

      def action1(message)
        Ruboty::Yo::Actions::Action1.new(message).call
      end

      def action2(message)
        Ruboty::Yo::Actions::Action2.new(message).call
      end
    end
  end
end
~~~

* ./lib/ruboty/yo/actions/action1.rb (generated code)

~~~ruby
module Ruboty
  module Yo
    module Actions
      class Action1 < Ruboty::Actions::Base
        def call
          message.reply("TODO: write a message.")
        end
      end
    end
  end
end
~~~

* ./lib/ruboty/yo/actions/action2.rb (generated code)

~~~ruby
module Ruboty
  module Yo
    module Actions
      class Action2 < Ruboty::Actions::Base
        def call
          message.reply("TODO: write a message.")
        end
      end
    end
  end
end
~~~

## Contributing

1. Fork it ( https://github.com/blockgiven/ruboty-gen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
