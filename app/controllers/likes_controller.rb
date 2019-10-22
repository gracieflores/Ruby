class LikesController < ApplicationController

    def create
        # if !Post.joins(:likes).where(:likes => {user_id: current_user.id})
        if !(Post.find(params[:post_id]).users.include?(User.find(current_user.id)))
            @like = Like.create(user: User.find(params[:user_id]), post: Post.find(params[:post_id]))
        end
        redirect_to '/posts'
    end


end
