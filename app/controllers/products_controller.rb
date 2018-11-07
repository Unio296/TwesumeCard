class ProductsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save                                                          #resumeを保存
      flash[:success] = "ポートフォリオを投稿しました"                              #flashに成功メッセージ
      redirect_to root_url                                                      #rootにリダイレクト
    else                                                                        #保存できなかった場合
      flash[:danger] = "ポートフォリオを投稿できませんでした"                                    #flashに成功メッセージ
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
    @product.destroy
    flash[:success] = "投稿を削除しました"
    redirect_back(fallback_location: root_url)   #redirect_back(fallback_location: root_url)はDELETEリクエストが発行されたページに戻す
  end

  private
    def product_params
      params.require(:product).permit(:title, :url, :description, :image)
    end

    def correct_user
      @product = current_user.products.find_by(slug: params[:slug])             #削除するproductがcurrent_userが保有しているか確認
      
      if @product.nil?
        flash[:danger]="あなたのポートフォリオではありません"
        redirect_to root_url if @product.nil?
      end
    end

end
