class Computers::SearchController < ApplicationController

  def index
    if person_id.present?
      relation = Computer.joins(:people).where(people:{id:person_id.to_i}).search(search)
      @count = relation.uniq.count
      @computers = relation.uniq.order([sort, order].join(' ')).limit(limit).offset(offset)
    else
      relation = Computer.search(search)
      @count = relation.count
      @computers = relation.order([sort, order].join(' ')).limit(limit).offset(offset)
    end

    data = {}
    data[:total] = @count
    data[:name] = :computers
    data[:rows] = []
    @computers.each do |c|
      data[:rows] << {
        id:c.id,
        name:c.name,
        name_ruby:c.name_ruby,
        name_en:c.name_en,
        description:c.description,
        assignments:PersonComputer.includes(:assignment).where(person_id:person_id, computer_id:c.id).map{ |e|
          a = e.assignment
          {
            id:a.id,
            name:a.name,
            name_ruby:a.name_ruby,
            name_en:a.name_en,
            description: a.description,
            color:a.color,
            order:a.order,
          }
        }.sort_by{ |a| a[:order] },
        # x:PersonComputer.includes
        # supplier:c.supplier.name,
        # manufacturer:cmanufacturer.name,
        created_at:c.created_at,
        updated_at:c.updated_at,
      }
    end
    render json:data
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
