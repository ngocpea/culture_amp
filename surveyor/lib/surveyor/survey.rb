module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize params
      @name = params[:name]
      @questions = []
      @responses = []
    end

  end
end
