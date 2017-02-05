class Computers::SearchController < ApplicationController

  def index
    if person_id.present?
      relation = Computer.joins(:people).includes(:person_computers).where(people:{id:person_id.to_i}).search(search)
      @count = relation.uniq.count
      @computers = relation.uniq.order([sort, order].join(' ')).limit(limit).offset(offset)
    else
      relation = Computer.joins(:people, :person_computers).search(search)
      @count = relation.count
      @computers = relation.order([sort, order].join(' ')).limit(limit).offset(offset)
    end

    computer_assignments = ComputerAssignment.all.select(:id, :key)

    data = {}
    data[:total] = @count
    data[:name] = :computers
    data[:rows] = []

    @computers.each do |c|
      computer_assignment_ids = c.person_computers.map{ |person_computer|
        if person_computer.person_id == person_id.to_i
           person_computer.computer_assignment_id
        end
      }.compact
      row = {
        id:c.id,
        name:c.name,
        name_ruby:c.name_ruby,
        name_en:c.name_en,
        description:c.description,
        created_at:c.created_at,
        updated_at:c.updated_at,
      }
      computer_assignments.each do |ca|
        row["assignment_#{ca.key}"] = computer_assignment_ids.include?(ca.id)
      end
      data[:rows] << row
    end

    if params[:sort] =~ /^assignment/
      data[:rows].sort!{ |row|
        row[params[:sort]] ? 1 : -1
      }
    end
    if params[:order] =~ /^desc$/
      data[:rows].reverse!
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
