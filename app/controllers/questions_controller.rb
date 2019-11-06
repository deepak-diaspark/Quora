class QuestionsController < ApplicationController
  
  
  def index
    @question = Question.new
  end
  def answer
    @question = Question.all
  end
  def new
    @question = Question.where('email_id = ?', current_user.email)
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    
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
    params.require(:question).permit(:question, :email_id)
  end
end
