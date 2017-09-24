#!/usr/bin/ruby
require_relative './question.rb'


module Surveyor
  class Answer
    
    attr_reader :question, :value

    def initialize params
     @question = params[:question]
     @value = params[:value]
    end    
    
    def valid?

      if @question != nil && @value != nil
	if (@value <= 5)
          return true
        else
	  return false
      end
    end
   end
end
end
