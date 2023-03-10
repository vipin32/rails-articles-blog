class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def new
        @article = Article.new 
    end

    def create

        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:success] = "Article saved successfully!"
            redirect_to article_path(@article)
        else
            render 'new'
        end

        # render plain: params[:article].inspect
    end


    def edit
    end

    def update
        
        if @article.update(article_params)
            flash[:success] = "Article updated successfully!"
            redirect_to article_path(@article)
        else
            render 'edit'
        end

    end

    def destroy

        if @article.destroy
            flash[:success] = "Article deleted successfully"
        else
            flash[:notice] = "Something went wrong while deleting article"
        end

        redirect_to articles_path

    end

    private 

    def set_article
        @article = Article.find(params[:id]) 
    end

    def article_params
        params.require(:article).permit(:title, :description, :user_id)
    end

    def require_same_user
        if current_user != @article.user and !current_user.admin?
            flash[:danger] = "You must be the owner of the article to perform any action"
            redirect_to root_path
        end
    end

end