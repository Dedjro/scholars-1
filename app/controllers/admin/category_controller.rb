class Admin::CategoryController < ApplicationController
  before_action only: ["edit","update","destroy"]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect admin_categories_path, notice: "Category crée avec succès"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect admin_categories_path, notice: "Category mis à jour avec succès"
    end
  end

  def destroy
    if @category.destroy
      redirect admin_categories_path, notice: "Category supprimé avec succès"
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title,:description,:status)
  end
end
