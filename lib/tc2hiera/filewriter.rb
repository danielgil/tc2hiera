require 'yaml'

module Tc2hiera

  class Filewriter

    def initialize(options, data)
         @data = data
         @file = options[:file]
         self.write
    end

    def write
      # Open 'file' and write, line by line, the contents of 'data'
      # in YAML formatting
      File.open(@file, 'w') do |file|
          file.write(@data.to_yaml)
      end

    end

  end
end