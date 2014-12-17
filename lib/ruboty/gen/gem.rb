module Ruboty
  module Gen
    class Gem
      attr_reader :options, :ruboty_plugin_name, :actions, :thor

      def initialize(options, ruboty_plugin_name, actions, thor)
        @options = options
        @ruboty_plugin_name = ruboty_plugin_name.chomp("/")
        @actions = actions
        @thor = thor
      end

      def run
        ### copy from bundler :P
        name = "ruboty-#{ruboty_plugin_name}" # remove trailing slash if present
        ruboty_plugin_constant_name = ruboty_plugin_name.split('_').map{|p| p[0..0].upcase + p[1..-1] }.join
        underscored_name = name.tr('-', '_')
        namespaced_path = name.tr('-', '/')
        target = File.join(Dir.pwd, name)
        constant_name = name.split('_').map{|p| p[0..0].upcase + p[1..-1] }.join
        constant_name = constant_name.split('-').map{|q| q[0..0].upcase + q[1..-1] }.join('::') if constant_name =~ /-/
        constant_array = constant_name.split('::')
        git_user_name = `git config user.name`.chomp
        git_user_email = `git config user.email`.chomp
        constant_actions = actions.map { |e|camelize(e) }

        opts = {
          :name               => name,
          :ruboty_plugin_name => ruboty_plugin_name,
          :ruboty_plugin_constant_name => ruboty_plugin_constant_name,
          :underscored_name   => underscored_name,
          :namespaced_path    => namespaced_path,
          :makefile_path      => "#{underscored_name}/#{underscored_name}",
          :constant_name      => constant_name,
          :constant_array     => constant_array,
          :author             => git_user_name.empty? ? "TODO: Write your name" : git_user_name,
          :email              => git_user_email.empty? ? "TODO: Write your email address" : git_user_email,
          :test               => options[:test],
          :ext                => options[:ext],
          :actions            => actions,
          :constant_actions   => constant_actions
        }

        thor.template(File.join('ruboty/handlers/newgem.rb.tt'),       File.join(target, "lib/ruboty/handlers/#{ruboty_plugin_name}.rb"),            opts)
        action_template = @options['rescue'] ? 'newgem_rescue.rb.tt' : 'newgem.rb.tt'
        actions.each do |action|
          opts[:constant_action] = camelize(action)
          opts[:action] = action
          thor.template(File.join("ruboty/newgem/actions/#{action_template}"), File.join(target, "lib/ruboty/#{ruboty_plugin_name}/actions/#{action}.rb"), opts)
        end
      end

      private

      def camelize(text)
        text.split('_').map { |e|e.capitalize }.join
      end
    end
  end
end
