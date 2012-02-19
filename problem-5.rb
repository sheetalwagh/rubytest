# Problem 5
#
# 1. Provide the models required
# 2. Each article can be related to many articles (or none).
# Provide code for making @article.related_articles work
# 3. Clean up the code according to rails conventions

class ArticleController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @into = nil

    if current_user.roles.map {|r| r.to_s}.include?('admin')
      @info = @article.info
    end

    @comments = @article.comments if !(params[:show_comments].blank?)
    @related_articles = @article.related_articles if params[:hide_related].blank?
  end
end

class Articles < ActiveRecord::Base
  has_many :related_articles, :class_name => "Article"
  belongs_to :main_article, :class_name => "Article",
    :foreign_key => "article_id"
  has_many :comments
  has_one :info
end

class Comments < ActiveRecord::Base
  belongs_to :article
end

class Info < ActiveRecord::Base
  belongs_to :article
end
