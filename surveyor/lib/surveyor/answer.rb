#!/usr/bin/ruby

module Surveyor
  class Answer
    attr_reader :question, :value

    def initialize(params)
      @question = params[:question]
      @value = params[:value]
    end

    def valid?
      if !@question.nil? && !@value.nil?
        if @question.type == 'free_text'
          true
        elsif @value <= 5
          true
        else
          false
        end
      end
    end
  end
end
