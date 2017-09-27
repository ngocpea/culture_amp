#!/usr/bin/ruby

module Surveyor
  class Question
    attr_reader :title, :type

    def initialize(params)
      @title = params[:title]
      @type = params[:type]
    end
  end
end
