class ArticlesController < ApplicationController

 def index
   @articles = Article.all       
 end
 
 def create
   @article = Article.new
 end
 
 def new
   @article = Article.new(article_params)
   if @article.save
   flash[:notice] = "Article Successfully Created!"
   redirect_to article_path
   else
     render 'new'
   end
 end
 
 def show
   @article = Article.find(params[:id])
 end 
 
 def edit
   @article = Article.find(params[:id])
 end 

 def update
   @article = Article.find(params[:id])
   if @article.update(article_params)
     flash[:notice] = "Article Successfully Updated!"
     redirect_to article_path
   else
     render 'edit'
   end
 end

 def destroy
   @article = Article.find(params[:id])
   @article.destroy
   flash[:notice] = "Article Successfully Deleted!"
   redirect_to articles_path
 end 
 
 private
 def article_params
   params.require(:articles).permit(:title, :description)
 end
 
end