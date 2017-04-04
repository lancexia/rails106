class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.destroy(params[:id])
    @post.destroy
    redirect_to account_posts_path(@group), alert: "Post Deleted!"
  end




    def group_params
      params.require(:group).permit(:title, :description)
    end
end
