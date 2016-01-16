module Api::V1
  class TagsController < ApplicationController

    def index
      if params[:note_id]
        note = Note.find(params[:note_id])
        render json: TagsSerializer.new(note.tags).to_json, status: :ok
      else
        render json: TagsSerializer.new(Tag.all).to_json, status: :ok
      end
    end

    def show
      tag = Tag.find(params[:id])
      render json: TagsSerializer.new(tag).to_json, status: :ok
    end

  end
end
