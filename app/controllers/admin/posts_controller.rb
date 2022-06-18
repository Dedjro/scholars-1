class Admin::PostsController < BaseController
  layout 'admin'
  before_action :set_post, only: [:destroy,:update,:show,:edit]
  def index
      @posts = Post.all
      # @items = params[:items] || 25
      # @pagy, @posts = pagy(@posts, items: @items)
      # @posts = @posts.decorate
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: "Enregistrement effectué avec succès"
    end  

  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: "Modification effectuée avec succès"
    end
  end

  def show
    
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path, notice: "Suppression effectuée avec succès"
    end
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
