require_relative 'options'
require_relative 'filewriter'

module Tc2hiera
  class Runner
    def initialize(argv)
      @options = Tc2hiera::Options.new(argv)
    end

    def run
      Tc2hiera::Filewriter.new(@options.options, @options.data)
    end
  end
end