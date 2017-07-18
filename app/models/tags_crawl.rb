require 'forwardable'
require "singleton"
require 'delegate'
class TagsCrawl 
  include ActiveModel::Model
  attr_accessor :name, :weight
  include Enumerable
  extend Forwardable
  include Singleton
  def initialize(attributes={})
    self.name = attributes[:name]
    self.weight = attributes[:weight]
    @msg=['a', 'b', 'c']
    @queue = attributes[:queue]
  end
  
  def each
    @msg.each { |msg| 
      yield msg 
    }  
  end

  def entries
    results = []
    self.each  do |entry|
      results << entry
      debugger
    end
    results 
  end
  
  def update
     'update'
  end

  def append
    'append'
  end

  def_delegator :@queue, :update
  attr_accessor :queue
  
end

class Hello
  include ActiveModel::Model
  def sayHello
    'ketty'
  end
end

class Queue
  def update
    'Queue update'
  end

  def insert
    'Queue insert'
  end
end

class Queue1 < SimpleDelegator
  def initialize(*args)
     @hello = Hello.new
     debugger
     super(@hello)
  end
  
  def setObj
     __setobj__(@hello)
  end 
  
  def update
    'Queue update'
  end

  def insert
    'Queue insert'
  end
end

