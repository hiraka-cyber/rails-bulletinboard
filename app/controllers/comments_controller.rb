class CommentsController < ApplicationController
    def create
        @threader = Threader.find(params[:threader_id])
        @comment = @threader.comments.create(comment_params)
        redirect_to threader_path(@threader)
    end

    def destroy
        @threader = Threader.find(params[:threader_id])
        @comment = @threader.comments.find(params[:id])
        @comment.destroy
        redirect_to threader_path(@threader)
    end

    private
     def comment_params
        params.require(:comment).permit(:commenter, :body)
     end
end
