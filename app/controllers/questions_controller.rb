class QuestionsController < ApplicationController
  
  def index
    @question = Question.new
  end
  
  def answer
    @question = Question.all
  end

  def new
    @question = current_user.questions
  end

  def show
    @question = Question.find(params[:id])  
  end

  def create
    @question = current_user.questions.create(question_params)
    @question.save
    redirect_to @question
  end

  def update
    @question = Question.find(params[:id])
   
    if @question.update(question_params)
      redirect_to @question
    else
      render 'show'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
   
    redirect_to @question
  end
  
  private
  def question_params
    params.require(:question).permit(:question, :email_id, :user_id)
  end
end
