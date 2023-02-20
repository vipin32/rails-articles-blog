class CategoriesController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, except: [:index, :show]

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category create successfully"
            redirect_to categories_path
        else
            render 'new'
        end
    end

    def show

    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:success] = "Category updated successfully"
            redirect_to categories_path
        else
            render 'edit'
        end
    end

    def destroy
        if @category.destroy
            flash[:success] = "Category deleted successfully"
            redirect_to categories_path
        end
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end


    def category_params
        params.require(:category).permit(:name)
    end

    def require_admin
        if !logged_in? || (logged_in? && !current_user.admin?)
            flash[:danger] = "Only admin users can perform such actions"
            redirect_to root_path
        end
    end

    


end