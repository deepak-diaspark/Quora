    class CommentsController < ApplicationController
      def index
        
      end
        def create
          @question = Question.find(params[:question_id])
          @comment = @question.comments.create(comment_params)
          redirect_to question_path(@question)
        end
       
        def destroy
          @question = Question.find(params[:question_id])
          @comment = @question.comments.find(params[:id])
          @comment.destroy
          redirect_to question_path(@question)
        end

        def upvote
          @comment = Comment.find(params[:id])
          @comment.upvote_by current_user
          redirect_to comments_path
        end

        def downvote
          @comment = Comment.find(params[:id])
          @comment.downvote_by current_user
          redirect_to comments_path
        end

        private
          def comment_params
            params.require(:comment).permit(:commenter, :body)
          end
      end