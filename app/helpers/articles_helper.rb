module ArticlesHelper
  require File.expand_path('../../commons/factories/materials_class', __FILE__)
  require File.expand_path('../../commons/business/articles_business', __FILE__)
  require File.expand_path('../../commons/config/articles_config', __FILE__)
  require File.expand_path('../../commons/business/tags_business', __FILE__)
  require File.expand_path('../../commons/container/articles_container', __FILE__)
  def markdown(text)
    options = {   
        :autolink => true, 
        :space_after_headers => true,
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :hard_wrap => true,
        :strikethrough =>true
    }
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay,options)
    markdown.render(text).html_safe
  end
   
  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end
   
end
