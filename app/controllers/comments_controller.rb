class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    #@comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params.require(:comment).permit(:name, :content))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        @comments = @post.comments
        format.html {render 'posts/show'}
        #format.html {redirect_to 'posts/show'}

        #@comment = @post.comments.build
        #@id = :post_id
        #params[:id] = params[:post_id]
        #format.html {redirect_to controller: :posts, action: :show}#, collection: :id}
        #format.html {redirect_to action: 'posts#index' }
        #format.html { redirect_to @post, collection: @comment}
        #format.html { render action: post_path(@post), collection: @comment }#'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
