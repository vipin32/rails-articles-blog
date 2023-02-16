class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 10)
    end

    def show
    end

    def new
        @article = Article.new 
    end

    def create

        @article = Article.new(article_params)
        @article.user = User.first
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

end