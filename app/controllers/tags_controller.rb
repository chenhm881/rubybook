class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])  
  end
  
  def index
    @tags = Tag.all
  end
  
  def new
    @tag = Tag.build 
  end

  def edit
    @tag = Tag.find(params[:id]) 
  end

  def update
    @tag = Tag.find(params[:id])
    respond_to do |format|
      if @tag.update(params[:tag].permit!)
        format.html {redirect_to tags_path}
        #format.js
        #format.json {render json: 'json', status: :unprocessable_entity}
      else
        fromat.html { render action: :new}
      end
    end 

  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end 

end