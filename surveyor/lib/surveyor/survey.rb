module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize params
      @name = params[:name]
      @questions = []
      @responses = []
    end
    
    def participation_percentage(question)
      total_responses = @responses.count
      total_responses_answered = @responses.count { |response| response.answers.any? {|answer| answer.question == question } }
      return (( total_responses_answered.to_f / total_responses )* 100).round(2) 
    end
   
  end
end
