# Instructions for this test:
# # 1. Please clone this gist as a git repo locally
# # 2. Create your own github repo called 'rubytest' (or a name of your choice) and add this repo as a new remote to the cloned repo
# # 3. Edit this file to answer the questions, and push this file with answers back out to your own 'rubytest' repo.
#
# Problem 1: Explain briefly what this code does, fix any bugs, then clean it up however you
#  like and write a unit test
#

def make_string(values)
  tmp = ''
  values.each do |v|
    tmp += v + ','
  end
  return tmp
end

# Problem 2. This is a piece of code found in a fictional Rails controller and model.
# # Point out any bugs or security problems in the code, fix them, and refactor the code to
# # make it cleaner.
#
class ProfileController < ApplicationController
  def show
    @user = User.find(:first, :conditions => "name = '#{params[:name]}'")
    @roles = Role.find(:all, :conditions => "user_id = #{@user.id}")
  end
end

class User < ActiveRecord::Base
end

class Role < ActiveRecord::Base
end

# Problem 3
# a: What problems can arise when users hits the get_pdf action?
# b: If there are problems, how can it be solved?

class PdfController < ApplicationController
  def get_pdf
    send_data Pdf.create(params[:contents])
  end
end

class Pdf
  def self.create(contents)
    make_pdf(contents) # takes 30 seconds to run
  end
end

# Problem 4
# A controller action is taking 10 seconds to run. Most of the time is being
# spent in a view which is a large file.(1000 lines). How will you go about
# debugging the speed issue?
#
#


# Problem 5
#
# 1. Provide the models required
# 2. Each article can be related to many articles (or none).
# Provide code for making @article.related_articles work
# 3. Clean up the code according to rails conventions

class ArticleController < ApplicationController
  def show
    @article = Article.find(params[:id])
    if current_user.roles.map {|r| r.to_s}.include?('admin')
      @info = Info.find(:first, :conditions => "article_id = #{@article.id}")
    else
      @info = nil
    end
    if params[:show_comments] && params[:show_comments] != ''
      @comments = Comment.find(:first, :conditions => "article_id = #{@article.id}")
    end
    if !(params[:hide_related] && params[:hide_related] != '')
      @related_articles = @article.related_articles
    end
  end
end


# Problem 6:
# What are the two gems/plugins that you have found extremely useful?
# Why did you choose them?
# Did they have any alternatives? If yes, what factors made you choose these gems
# and not the alternatives ?
#

# Problem 7
# What's the deployment stack you use? Why?
