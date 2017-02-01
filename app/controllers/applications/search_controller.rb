class Applications::SearchController < ApplicationController

  def index
    if person_id.present?
      relation = Application.includes(:people).where(people:{id:person_id.to_i}).search(search)
      @count = relation.count
      @applications = relation.order([sort, order].join(' ')).limit(limit).offset(offset)
    else
      relation = Application.search(search)
      @count = relation.count
      @applications = relation.order([sort, order].join(' ')).limit(limit).offset(offset)
    end
  end

  private

  def person_id
    params[:person_id]
  end

  def search
    params[:search]
  end

  def limit
    params[:limit]
  end

  def offset
    params[:offset]
  end

  def sort
    'applications.' + (Application.attribute_names.include?(params[:sort]) ? params[:sort] : 'id')
  end

  def order
    %w(asc desc).include?(params[:order]&.downcase) ? params[:order].downcase : 'asc'
  end

end
