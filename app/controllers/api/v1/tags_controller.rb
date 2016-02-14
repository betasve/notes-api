module Api::V1
  class TagsController < ApplicationController

    def index
      if params[:note_id]
        @tags = Note.find(params[:note_id]).tags
      else
        @tags = Tag.all
      end
    end

    def show
      @tag = Tag.find(params[:id])
    end

  end
end
