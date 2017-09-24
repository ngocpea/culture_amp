#!/usr/bin/ruby

module Surveyor
  class Response
    attr_reader :user, :answers

    def initialize params
      @user = params[:user]
      @answers = []
    end   

  end
end
