require 'Pry'

class AnswersController < ApplicationController

  # def show
  #   @id = params['id']
  #   @question = Question.find(params['id'])
  #   @answers = @question.answers
  #   @answer = Answer.new
  # end

  def create
    @question = Question.find(params['question_id'])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    @answer.best = false
    if @answer.save
      redirect_to @question, notice: 'Answer was successfully added.'
    else
      @answers = @question.answers
      flash[:notice] = 'Invalid Answer.'
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
