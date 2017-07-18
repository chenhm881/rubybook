module CategoriesHelper
  
  def find_all_child_categories(category)
    return if category.nil?
      
    @@categories_html = "<ul>"
    category.child_categories.find_each do |ct|
      @@categories_html += "<li><a href='javascript:void(0)'><span id='#{ct.id}'>#{ct.name}<span></a></li>"
      from_child_categories(ct)
    end
     @@categories_html += "</ul>"
  end


  def from_child_categories(category)
     if category.child_categories.length <= 0
        return
     end
     @@categories_html += "<ul>"
     category.child_categories.find_each do |ct|
       @@categories_html += "<li><a href='javascript:void(0)'><span id='#{ct.id}'>#{ct.name}<span></a></li>"
       from_child_categories(ct)
     end
     @@categories_html += "</ul>"
  end


end
