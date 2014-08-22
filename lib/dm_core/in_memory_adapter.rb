require 'dm-core/adapters/in_memory_adapter'

DataMapper::Adapters::InMemoryAdapter.class_eval do

  def aggregate(query)
    result = []

    if query.fields.first.operator.eql? :count
      result[0] = read(query).size
    else
      values = read(query).map { |record| record[query.fields.first.target.name.to_s]}
      if query.fields.first.operator.eql? :max
        result[0] = values.max
      elsif query.fields.first.operator.eql? :min
        result[0] = values.min
      elsif query.fields.first.operator.eql? :sum
        result[0] = values.sum
      elsif query.fields.first.operator.eql? :avg
        result[0] = values.sum / values.size
      end
    end

    result
  end

end
