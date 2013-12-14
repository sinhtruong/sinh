class CommentsController<ApplicationController
 before_filter :authenticate_user!

 def create
   @post = Post.find(params[:post_id])
   comment_attr = params[:comment].merge user_id: current_user.id
   @comment = @post.comments.create(comment_attr)
   flash[:notice] = t(:flash_thanks_commenting)
   PostMailer.comment_email(@post.user.email,current_user.email,@comment.body,post_url(@post)).deliver
   respond_to do |format|
      format.js
   end
 end
end