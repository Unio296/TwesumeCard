class ProductsController < ApplicationController
  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save                                                          #resumeを保存
      flash[:success] = "Product posted!"                                    #flashに成功メッセージ
      redirect_to root_url                                                      #rootにリダイレクト
    else                                                                        #保存できなかった場合
      flash[:danger] = "Product cannot be posted!"                                    #flashに成功メッセージ
      render 'new'                                                #homeアクションでrender
    end
  end

  def edit
    @product = Product.find_by(slug: params[:slug])
  end

  def update
    @product = Product.find_by(slug: params[:slug])
    
    if @product.update_attributes(product_params)
      flash[:success] = "投稿を更新しました"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def product_params
      params.require(:product).permit(:title, :url, :description, :image)
    end

end
