class Admin::DashboardsController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!
    def users_index
      @users = User.all
    end

    def stores_index
      @stores = Store.all
    end

    def posts_index
      @posts = Post.all
    end

    def mypage
      @admin = Admin.find(current_admin.id)
    end
end
