class ArticlesController < ApplicationController
    def new
      @article = Article.new
    end
    def show 
      @article = Article.find(params[:id])
    end

    def edit
      @article = Article.find(params[:id])  
    end

    def update 
        @article = Article.find(params[:id])
        if @article.update(article_param)
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
          else
            render 'edit'
          end
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


end