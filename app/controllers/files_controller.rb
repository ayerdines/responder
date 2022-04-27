class FilesController < ApplicationController

  def quote
    @data = helpers.get_random_row
    respond_to do |format|
      format.json { render json: @data }
      format.html
      format.xml { render :xml => @data.to_xml(root: :quote) }
    end
  end
end
