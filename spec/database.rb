$:.unshift(File.dirname(__FILE__) + '/../lib')
$:.unshift(File.dirname(__FILE__) + '/../../rspec/lib')

require 'rubygems'

require File.dirname(__FILE__) + '/../init'
require 'spec'
  
DataMapper::Logger.new(STDOUT)
DataMapper.setup(:default, "sqlite3::memory:")
DataMapper.auto_migrate!

# Purely useful for test cases...
class Story 
  include DataMapper::Resource
  
  def tell; text; end       
  def whatever(n, _); tell*n; end
  
  handle_asynchronously :whatever
end
