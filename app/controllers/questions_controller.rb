class QuestionsController < ApplicationController
  def create
    Question.create(
      body: params[:question][:body],
      user_id: params[:question][user_id]
    )
  end
end
