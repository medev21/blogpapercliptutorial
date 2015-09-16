class ParagraphsController < ApplicationController
  before_action :find_post
  before_action :find_paragraph, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  def create
    @paragraph = @post.paragraphs.create(paragraph_params)
    @paragraph.user_id = current_user.id

    if @paragraph.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @paragraph.update(paragraph_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @paragraph.destroy
    redirect_to post_path(@post)
  end

  private
    def paragraph_params
      params.require(:paragraph).permit(:content, :content_image)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_paragraph
      @paragraph = Paragraph.find(params[:id])
    end
end
