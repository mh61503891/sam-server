class Computers::SearchController < ApplicationController

  def index
    search = params['search']
    limit = params['limit']
    offset = params['offset']
    @count = Computer.search(search).count
    @computers = Computer.search(search).order([sort, order].join(' ')).limit(limit).offset(offset)
  end

  private

  def sort
    Computer.attribute_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def order
    %w(asc desc).include?(params[:order]&.downcase) ? params[:order].downcase : 'asc'
  end

end
