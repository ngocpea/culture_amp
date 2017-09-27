#!/usr/bin/ruby

module Surveyor
  class Answer
    attr_reader :question, :value

    def initialize(params)
      @question = params[:question]
      @value = params[:value]
    end

    def valid?
      if @question.nil? && @value.nil? && @question.type == 'free_text' && @value <= 5
        true
      end
      false
    end
  end
end
