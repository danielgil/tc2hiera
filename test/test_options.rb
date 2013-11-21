require 'rubygems'
gem 'test-unit'
require 'test/unit'
require_relative '../lib/tc2hiera/options'

class TestOptions < Test::Unit::TestCase

  def test_empty_params
    options = Tc2hiera::Options.new([])
    assert_equal(options.options, {})
    assert_equal(options.data, {})
  end

  def test_file_param
    options = Tc2hiera::Options.new(['-f', 'testfile'])
    expectedoptions = {
        :file => 'testfile'
    }
    assert_equal(expectedoptions, options.options)
    assert_equal({}, options.data)
  end

  def test_data_pairs
    options = Tc2hiera::Options.new(['-f', 'testfile', '0', '1', '"a"', '"b"', '\'c\'', 'd', 'url', 'http://some/value.a?=b'])

    expectedoptions = {
        :file => 'testfile'
    }

    expecteddata = {
        '0'   => '1',
        'a'   => 'b',
        'c'   => 'd',
        'url' => 'http://some/value.a?=b'
    }
    assert_equal(expectedoptions, options.options)
    assert_equal(expecteddata, options.data)
  end

  def test_number_of_params
    assert_raise(ArgumentError ) do
      Tc2hiera::Options.new(['-f', 'testfile', '0', '1', '2'])
    end

  end
end
