class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ destroy ]
  before_action :set_post, only: %i[ new create destroy ]
  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments or /comments.json
  def create
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.turbo_stream do
          render turbo_stream:  [
           turbo_stream.update('new_comment', partial: 'comments/form', locals: { post: @post, comment: Comment.new } ),
           turbo_stream.prepend('comments', partial: 'comments/comment', locals: { post: @post, comment: @comment } )
          ]
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to [@post, @comment], notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:name, :content, :post_id)
    end
end
