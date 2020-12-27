class ArticlesController < ApplicationController

    before_action :set_article, only: [:edit,:update,:show,:destroy]

    def new
      @article = Article.new
    end
    def show 

    end

    def edit

    end

    def update 
        if @article.update(article_param)
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
          else
            render 'edit'
          end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article was successfully Deleted"
        redirect_to articles_path
    end 

    def index
      @articles = Article.all
    end

    def create  
      @article = Article.new(article_param)
      if @article.save
        flash[:notice] = "Article was successfully created"
        redirect_to article_path(@article)
      else
        render 'new'
      end
    end 

    private
      def article_param
        params.require(:article).permit(:title , :description)
      end
    
    private
      def set_article
        @article = Article.find(params[:id])
      end


end