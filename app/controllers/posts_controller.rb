class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ index new create destroy ]
  after_action :verify_authorized

  # GET /posts or /posts.json
  def index
    if params[:query].blank?
      @pagy, @posts = pagy(@user.posts.order("created_at DESC"))
      authorize @posts
    else
      @pagy, @posts = pagy(Post.filter_by_title(params[:query]).order("created_at DESC"))
      authorize @posts
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @pagy, @comments = pagy(@post.comments.order("created_at DESC"))
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = authorize @user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = authorize @user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = authorize Post.find(params[:id])
    end

    def set_user
      @user = current_user
      redirect_to root_url if @user.nil?
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :feed_id)
    end
end
