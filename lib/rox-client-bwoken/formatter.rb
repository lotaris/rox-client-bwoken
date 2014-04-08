require 'bwoken'
require 'bwoken/formatters/colorful_formatter'
require 'rox-client-ruby'

module Bwoken
  class RoxFormatter < Bwoken::ColorfulFormatter

    class << self
      def on name, &block
        method_name = "_on_#{name}_callback"
        define_method method_name do |*args|
          @original.send method_name, *args
          instance_exec *args, &block
        end
      end
    end

    def initialize

      @data = {}
      @original = Bwoken::ColorfulFormatter.new

      config = RoxClient.config
      @client = RoxClient::Client.new config.server, config.client_options
      @run = RoxClient::TestRun.new config.project
    end

    on :start do |line|
      prepare_result line
    end

    on :pass do |line|
      add_result line, true
    end

    on :fail do |line|
      add_result line, false
    end

    on :error do |line|
      add_result line, false
    end

    on :before_script_run do |path|
      @start ||= Time.now
    end

    on :complete do |line|
      @run.duration = ((Time.now - @start) * 1000).floor
      @client.process @run
    end

    def prepare_result line
      meta = rox_metadata line
      @data[meta[:name]] = { start: Time.now }
    end

    def add_result line, passed
      meta = rox_metadata line
      @run.add_result meta.merge(passed: passed, duration: ((Time.now - @data[meta[:name]][:start]) * 1000).floor)
      @data.delete meta[:name]
    end

    def rox_metadata line

      tokens = line.split(' ')
      name = tokens[4..-1].join(' ')

      return { name: name } unless m = name.match(/.*@rox\(([^\(\)]+)\)/)

      meta = { name: name.gsub(/@rox\([^\(\)]+\)/, '').strip, tags: [], tickets: [] }

      m[1].split(/\s+/).reject{ |s| s.empty? }.each do |part|
        if m = part.match(/c:(.+)/) || part.match(/category:(.+)/)
          meta[:category] << m[1]
        elsif m = part.match(/g:(.+)/) || part.match(/tag:(.+)/)
          meta[:tags] << m[1]
        elsif m = part.match(/t:(.+)/) || part.match(/ticket:(.+)/)
          meta[:tickets] << m[1]
        else
          meta[:key] = part
        end
      end

      meta
    end
  end
end
