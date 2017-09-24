#!/usr/bin/ruby
require_relative './question.rb'


module Surveyor
  class Answer
    
    attr_reader :answer, :value

    def initialize params
     @answer = params[:answer]
     @value = params[:value]
    end    

    def valid?
      if @question != nil && @value != nil
        return true
      elsif @answer == nil && @value != nil
        return true 
      #elsif @question && @value && (@question.type == 'free_text' || @value <= 5)
      # return true
      else
       return false
      end
    end

  end
end
