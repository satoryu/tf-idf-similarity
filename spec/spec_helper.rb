require 'rubygems'

require 'coveralls'
Coveralls.wear!

require 'rspec'
require File.dirname(__FILE__) + '/../lib/tf-idf-similarity'

MATRIX_LIBRARY = (ENV['MATRIX_LIBRARY'] || :matrix).to_sym
puts "\n==> Running specs with #{MATRIX_LIBRARY}"

case MATRIX_LIBRARY
when :gsl
  require 'gsl'
when :narray
  require 'narray'
when :nmatrix
  require 'nmatrix'
else
  require 'matrix'
end

RSpec.configure do |c|
  if MATRIX_LIBRARY == :gsl # GSL can't initialize an empty matrix
    c.filter_run_excluding :empty_matrix => true
  end
end
