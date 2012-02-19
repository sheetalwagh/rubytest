class ProfileController < ApplicationController
  def show
    @user = User.first_user(params[:name])
    @roles = Role.user_role(@user)
  end
end
 
class User < ActiveRecord::Base
  named_scope :first_user, lambda { |user_name|  first(:conditions => ["name = ?", user_name])}
end

class Role < ActiveRecord::Base
  named_scope :user_role, lambda { |user| find(:all, :conditions =>["user_id = ?", user.id]) }
end

