module Common
  module Parent
    class MaterialsBase

      def initialize(*args)          
      end
      
      def method_missing(method_name)
        puts "There's no method called #{method_name} here -- please try again." 
      end

      def self.inherited(subclass) 
        puts "#{self} just got subclassed by #{subclass}" 
      end

      def self.method_added(name)    
        puts "#{name} is a new method"    
      end

      def self.const_missing(const) 
        puts "#{const} is undefined-setting it to 1." 
      end

    end
  end  
  module Extan  
    require "delegate"
    require "singleton"
    class ExClass
       include Singleton
       def initialize(*args)
        @obj=args[0]
       end
       def exfun1
          @sta= Arr[0]
       end
 

       self.class_eval do
         def exfun2
            @sta = "Exfun2"
         end
       end
       def self.exfun3
         @sta="exfun3"
       end 
       
    end
   
  end

  module Forward
    require 'forwardable'
    class ExOne
      extend Forwardable
      def initialize(args=[])
        @queue = args
      end
      def update
        ik="update edit"
      end
      def_delegator :@queue, :update, :edit
      attr_accessor :queue
    end
  end
end
