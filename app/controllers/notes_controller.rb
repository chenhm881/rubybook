class NotesController < ApplicationController

  def create
    params.permit!
    @note = Article.create(params[:note])
    respond_to do |format |
      if @note.save
        format.html {}
        format.js {}
      else
        format.html {}
        format.js {}
      end
    end
  end

  def index
    @note = Article.new
    @notes = Article.all
  end

  def update
    params.permit!
    @tags = params[:tags].split(',')
    @note = Article.find(params[:id])
    respond_to do |format|
      if @note.update(params[:note])
         tags = @tags.select{|p| p =~ /\w+/ }
         tag_biz = Common::Business::TagBiz.new
         tag_biz.motive(tags, params[:id])
         tag_biz.remove(tags, params[:id])
         format.html {}
         format.js {}
      else
         format.html {}
         format.js {render object: @note}
      end
    end

  end

  def destroy
    params.permit!
    @note = Article.find(params[:id])
    respond_to do |format|
      if @note.destroy
        format.html {}
        format.js {}
      else
        format.html {}
        format.js {}
      end
    end
  end

end