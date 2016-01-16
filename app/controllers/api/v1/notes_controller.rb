module Api::V1
  class NotesController < ApplicationController
    before_action :ensure_request_type

    def index
      notes = Note.all

      render json: NotesSerializer.new(notes).to_json
    end

    def show
      note = Note.find(params[:id])

      render json: NotesSerializer.new(note).to_json
    end

    def create
      note = Note.new(permitted_params)
      if note.save
        render json: NotesSerializer.new(note).to_json, status: :created
      else
        render json: note.errors.to_json, status: :bad_request
      end
    end

    def update
      note = Note.find(params[:id])
      if note.update_attributes(permitted_params)
        render json: NotesSerializer.new(note).to_json, head: :ok
      else
        render json: note.errors.to_json, head: :bad_request
      end
    end

    def destroy
      note = Note.find(params[:id])
      if note.destroy
        render nothing: true, head: :ok
      else
        render json: note.errors.to_json, head: :bad_request
      end
    end

    private

    def permitted_params
      params.require(:data).require(:attributes).permit(:title, :body)
    end

    def ensure_request_type
      if request.env['CONTENT_TYPE'] != "application/json"
        raise ActionController::BadRequest
      end
    end
  end
end
