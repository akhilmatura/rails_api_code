require "dm_core/in_memory_adapter"

# Set some sensible defaults for DM.
DataMapper::Property.auto_validation(false)
DataMapper::Property.required(false)

module DataMapper
  class Query
    def assert_valid_offset(offset, limit)
      raise ArgumentError, "+options[:limit]+ must be greater than or equal to 0, but was #{limit.inspect}" if limit && limit < 0
    end
  end
end
