class BlogsController < ApplicationController
    before_action :set_blog,only:[:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
   @blog = Blog.new#モデルのインスタンス生成
  end

  def create
    @blog = Blog.create(blog_params)
    #パラメーターを取得する記述(送られてきた値をデータベースに保存できる)
    if params[:back]
      render :new
    else
    if @blog.save

    redirect_to new_blog_path, notice:"ブログを作成しました" #"/blogs/new" 
    #blogsコントローラののnewアクションに飛んでくださいという意味
    else

      render :'new'
    end
  end
end

  def show
    #@blog = Blog.find(params[:id])
  end

  def edit
    #@blog = Blog.find(params[:id])
  end

  def update
    #@blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"ブログを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid? #確認画面に行く前に、バリデーションで引っかかっているならいかないようにする。
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
  #idをキーとして値を取得するメソッド

end
