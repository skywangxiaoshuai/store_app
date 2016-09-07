class CartsController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = current_user.cart
    @line_items_by_group = @cart.line_items.group_by(&:product_id)
    #遍历购物车中的所有商品 ,计算处总的价格
    @total_price = 0
    @cart.line_items.each do |line_item|
      @total_price += line_item.product.price
    end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy

  end

  def delete_line_item
    binding.pry
    line_items = LineItem.where(cart_id: params[:cart_id], product_id: params[:product_id])
    line_items.map(&:destroy)
    respond_to do |format|
      format.html { redirect_to cart_path(params[:cart_id]), notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.fetch(:cart, {})
  end

  #判断当前购物车是否为空,不为空返回true,为空返回false
  def cart_no_empty?
    !current_cart.nil?
  end


end
