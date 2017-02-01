class Computers::SearchController < ApplicationController

  def index
    if person_id.present?
      relation = Computer.includes(:people).where(people:{id:person_id.to_i}).search(search)
      @count = relation.count
      @computers = relation.order([sort, order].join(' ')).limit(limit).offset(offset)
    else
      relation = Computer.search(search)
      @count = relation.count
      @computers = relation.order([sort, order].join(' ')).limit(limit).offset(offset)
    end
  end

  private

  def person_id
    params[:person_id]
  end

  def search
    params[:search]
  end

  def sort
    'computers.' + (Computer.attribute_names.include?(params[:sort]) ? params[:sort] : 'id')
  end

  def order
    %w(asc desc).include?(params[:order]&.downcase) ? params[:order].downcase : 'asc'
  end

  def limit
    params[:limit]
  end

  def offset
    params[:offset]
  end

end
