class Product < ApplicationRecord
  enum status: [:man, :women] # 产品类型：男士产品、女士产品
  enum man_type: [:man_clothing, :man_shoes] # 男士产品类型： 男装、男鞋
  enum man_clothing_type: [:man_shirt, :man_pants] # 男装类型： 短袖、裤子
  enum man_shoes_type: [:man_hiking, :man_casual] # 男鞋类型： 登山鞋、休闲鞋

  enum women_type: [:women_clothing, :women_shoes] # 女士产品类型： 女装，女鞋
  enum women_clothing_type: [:women_shirt, :women_pants] # 女装类型： 短袖、裤子
  enum women_shoes_type: [:women_hiking, :women_casual] # 女鞋类型： 登山鞋、休闲鞋

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      return false
    end
  end
end
