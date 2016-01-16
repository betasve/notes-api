module Api::V1
  class SearchController < ApplicationController

    def index
      if params[:q]
        results = PgSearch.multisearch(params[:q])
        response = {}
        response[:links] = { self: api_v1_search_url }
        response[:data] = []
        results.each do |result|
          if result.searchable_type == "Note"
            response[:data] << NotesSerializer.new(Note.find(result.searchable_id)).to_json
          elsif result.searchable_type == "Tag"
            response[:data] << TagsSerializer.new(Tag.find(result.searchable_id)).to_json
          end
        end
        render json: response
      end
    end

  end
end
