require 'yaml'
require 'rubygems'
gem 'test-unit'
require 'test/unit'
require_relative '../lib/tc2hiera/filewriter'

class TestFilewriter < Test::Unit::TestCase

  def setup
    @data = {
        'port' => 8080,
        'some_url' => 'https://this.is.some/url?with=symbols',
        'c' => 3
    }
    @options = { :file => 'test.yaml' }
  end

  def test_write_yaml
    Tc2hiera::Filewriter.new(@options, @data)
    assert_equal(@data, YAML.load(File.read(@options[:file])))
  end

  def teardown
    File.delete(@options[:file]) if File.exist?(@options[:file])
  end



end