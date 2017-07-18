require 'delegate'
class MyDelegate < SimpleDelegator
include ActiveModel::Model
    def initialize
        @hello = Hello.new
        super(@hello)
    end
    def setObj
        __setobj__(@hello);
    end
end
class Hello
    def each
    end
    def helloworld()
        "hello world"
    end
end

