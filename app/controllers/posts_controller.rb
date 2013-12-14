class PostsController < ApplicationController
  before_filter :authenticate_user! , :only => [:edit, :create, :update, :destroy]
  def index
    @url=params[:url]
    if @url=='mypost'
      @posts = current_user.posts.paginate(page: params[:page],:per_page => 10)
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 1)
    end
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts,url: @url }
    end
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    respond_to do |format|
       if @post.save
        format.html{
         redirect_to(@post,notice:t(:flash_post_create_success))
         format.json{render json:@post,status: :created,location: @post}
        }
      else
        format.html{render action:"new"}
        format.json{
          render json:@post.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def  show
    @post = Post.find(params[:id])
     @comments = @post.comments.paginate(:page => params[:page], :per_page => 3)
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.user == current_user
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: t(:flash_post_update_success) }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "edit" }
        flash[:notice] = t(:flas_post_delete_error)
      end
    end
  end
  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      flash[:notice] = t(:flash_post_delete_success)
    else
      flash[:notice] = t(:flas_post_delete_error)
    end
    url=params[:url]
    if url=="mypost"
      redirect_to posts_path(url: url)
    else
      redirect_to posts_path
    end

  end
end
