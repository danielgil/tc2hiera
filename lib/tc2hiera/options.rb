require 'optparse'

module Tc2hiera
  class Options

    # Getter method for options
    attr_reader :options, :data

    # Receive the raw input from command line and parse it
    def initialize(argv)
      @options = {}
      @data = {}
      parse(argv)

    end

    private

    def parse(argv)
      OptionParser.new do |opts|
        opts.banner = 'Usage: tc2hiera -f FILE key value [key value] ...'

        opts.on('-f FILE','--file', 'Yaml file to be written') do |file|
          @options[:file] = file
        end

        opts.on('-h', '--help', 'Show this message') do
          puts opts
          exit
        end

        begin
          # If there are no arguments, show help
          argv = ["-h"] if argv.empty?

          # Otherwise, parse
          opts.parse!(argv)

          # If the number of remaining arguments in odd, raise ArgumentError
          raise ArgumentError if argv.size.odd? or argv.empty?

          argv.each_slice(2) do |elem|
            @data[elem[0].gsub(/['"]/, '')] = elem[1].gsub(/['"]/, '')
          end
        rescue OptionParser::ParseError, ArgumentError => e
          STDERR.puts e.message, "\n", opts
          raise
        end

      end
    end

  end
end