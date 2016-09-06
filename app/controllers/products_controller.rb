class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 展示所有产品的方法
  def all_products
    @all_products = Product.all
  end

  # 展示所有男士产品的方法
  def man_products
    @man_products = Product.man
  end

  # 展示所有男装
  def man_clothing
    @man_clothing = Product.man_clothing
  end

  # 展示男士所有短袖的方法
  def man_shirt
    @man_shirt = Product.man_shirt
  end

  # 展示男士所有休闲裤的方法
  def man_pants
    @man_pants = Product.man_pants
  end

  # 展示所有男鞋
  def man_shoes
    @man_shoes = Product.man_shoes
  end

  # 展示男士所有登山鞋的方法
  def man_hiking
    @man_hiking = Product.man_hiking
  end

  # 展示男士所有休闲鞋的方法
  def man_casual
    @man_casual = Product.man_casual
  end

  # 展示所有女士产品
  def women_products
    @women_products = Product.women
  end

  # 展示所有女装
  def women_clothing
    @women_clothing = Product.where(status: 'women')
  end

  # 展示所有女士短袖
  def women_shirt
    @women_shirt = Product.women_shirt
  end

  # 展示所有女士休闲裤
  def women_pants
    @women_pants = Product.women_pants
  end

  # 展示所有女鞋
  def women_shoes
    @women_shoes = Product.women_shoes
  end

  # 展示所有女士登山鞋
  def women_hiking
    @women_hiking = Product.women_hiking
  end

  # 展示所有女士休闲鞋
  def women_casual
    @women_casual = Product.women_casual
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price)
  end
end
