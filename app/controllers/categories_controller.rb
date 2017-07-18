class CategoriesController < ApplicationController
  def index

  end

  def show
    @category = Category.find(params.require(:id))
  end

  def new
    @category = Category.new
  end

  def create
    params.permit!  
    @category = Category.new(params.require(:category))
    @category.parent_id = 0 if @category.parent_id.nil?
    
    if @category.save
      respond_to do |format|
        format.html {redirect_to  @category, notice: 'successfully' }
        format.json {render action: 'show', status: :created, location: @category}
      end
    else
      respond_to do |format|
        format.html {render action: 'new', notice: 'successfully' }
        format.json {render json: @category.errors}
      end    
    end

  end

  def edit
     @category = Category.find(params.require(:id))
  end

  def update
     params.permit!  
     @category = Category.find(params.require(:id))
     if @category.update_attributes(params.require(:category).permit!)
        respond_to do |format|
          format.html {redirect_to @category, notice:'Update successfully'}
          format.json {render action: 'show', status: :created, location: @category}
        end
     else
        respond_to do |format|
          format.html {render action: 'new', notice: 'successfully' }
          format.json {render json: @category.errors}
        end    
     end

  end

  def destory
     
  end


end
