module Common
  module Factory
    require File.expand_path('../../parents/materials_base', __FILE__)
    class Material < Common::Parent::MaterialsBase
      prepend Common::Extan
      include Enumerable
      attr_accessor :articles
      attr_writer :statuses      
      def initialize(*args)
        super(args)
        @sta = "init"
        @obj = args[0]
      end

      def statuses= (prefix)
         @statuses ||= []  
         @statuses << prefix 
      end
            
      def each
        @statuses.each do |statuse|
           yield statuse
        end
      end
 
      def add_handler &block
        @commands ||= []
        @commands << block
      end
      
      alias :add_commands :add_handler

      public
        def handle
          by_sql = "" 
          @commands.each do | command | 
            if by_sql.empty?
               by_sql = command.call.select('id').to_sql
            else             
               by_sql = by_sql + ' union ' + command.call.select('id').to_sql               
            end 
          end
          @articles = Article.where("id  in (" + by_sql + ")")
        end

    end
    
  end
end
