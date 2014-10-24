require 'bundler'
require 'bundler/vendored_thor'
require 'bundler/cli'
require 'bundler/cli/gem'

module Ruboty
  module Gen
    class CLI < Bundler::CLI
      include Thor::Actions

      def self.start(*)
        super
      rescue Exception => e
        Bundler.ui = Bundler::UI::Shell.new
        raise e
      end

      def self.source_paths
        [File.expand_path('../../../templates', __dir__)]
      end

      desc "gem GEM [OPTIONS]", "Creates a skeleton for creating a ruboty plugin"
      def gem(name, *actions)
        actions = [name] if actions.size.zero?
        Bundler::CLI::Gem.new(options, "ruboty-#{name}", self).run
        Ruboty::Gen::Gem.new(options, name, actions, self).run
      end
    end
  end
end
