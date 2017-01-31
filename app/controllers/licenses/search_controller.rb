class Licenses::SearchController < ApplicationController

  def index
    search = params['search']
    limit = params['limit']
    offset = params['offset']
    @count = License.search(search).count
    @licenses = License.search(search).order([sort, order].join(' ')).limit(limit).offset(offset)
  end

  private

  def sort
    License.attribute_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def order
    %w(asc desc).include?(params[:order]&.downcase) ? params[:order].downcase : 'asc'
  end

end
