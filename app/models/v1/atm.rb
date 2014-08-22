class V1::Atm
  include DataMapper::Resource
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::Serialization

  # Include modules for extensions.



  storage_names[:'1162'] = 'atm'
  def self.default_repository_name
    :'1162'
  end



  # Property definitions

  property :id, Text, field: "Owner", key: true, required: false, lazy: false

  property :access_fees, Integer, field: "AccessFees", key: false, required: false, lazy: false

  property :availability, Text, field: "Availability", key: false, required: false, lazy: false

  property :camera, Text, field: "Camera", key: false, required: false, lazy: false

  property :handicap_accessible, Text, field: "HandicapAccessible", key: false, required: false, lazy: false

  property :location, Object, field: "Location", key: false, required: false, lazy: false

  property :parameter_city, Text, field: "City", key: false, required: false, lazy: false

  property :parameter_country, Text, field: "Country", key: false, required: false, lazy: false

  property :parameter_country_subdivision, Text, field: "CountrySubdivision", key: false, required: false, lazy: false

  property :parameter_distance_unit, Text, field: "DistanceUnit", key: false, required: false, lazy: false

  property :parameter_latitude, Float, field: "Latitude", key: false, required: false, lazy: false

  property :parameter_longitude, Float, field: "Longitude", key: false, required: false, lazy: false

  property :parameter_postal_code, Text, field: "PostalCode", key: false, required: false, lazy: false

  property :parameter_radius, Integer, field: "Radius", key: false, required: false, lazy: false

  property :shared_deposit, Text, field: "SharedDeposit", key: false, required: false, lazy: false

  property :sponsor, Text, field: "Sponsor", key: false, required: false, lazy: false

  property :support_emv, Integer, field: "SupportEMV", key: false, required: false, lazy: false

  property :surcharge_free_alliance, Text, field: "SurgchareFreeAlliance", key: false, required: false, lazy: false




  # Relationship definitions




  # Simple validations


  # Default scopes for System Admin
  attr_accessible :id, :access_fees, :address, :address_line_one, :address_line_two, :availability, :camera, :city, :country_code, :country_name, :country_subdivision_code, :country_subdivision_name, :distance, :distance_unit, :handicap_accessible, :latitude, :location, :longitude, :name, :parameter_city, :parameter_country, :parameter_country_subdivision, :parameter_distance_unit, :parameter_latitude, :parameter_longitude, :parameter_postal_code, :parameter_radius, :postal_code, :shared_deposit, :sponsor, :support_emv, :surcharge_free_alliance, as: :"System Admin"
  # Authorization for mass-assignment

  attr_accessible nil, as: :"Unauthenticated Default on create"
  attr_accessible nil, as: :"Unauthenticated Default on update"



  def self.create(attrs = {}, as: :default)
    resource = new
    resource.assign_attributes(V1::Atm.cast_attributes(attrs), as: as )
    resource.save
    resource
  end

  def initialize(attrs = {}, options = {})
    super({})
    self.assign_attributes(V1::Atm.cast_attributes(attrs), as: options[:as] )
  end

  def update(attrs = {}, options = {})
    self.assign_attributes(V1::Atm.cast_attributes(attrs), as: options[:as] )
    self.save
  end

  def serializable_hash(options={})
    super(options.merge(methods: []))
  end

  def as_json(options={})
    super(options.merge(methods: []))
  end

  def self.cast_attributes(attributes = {})
    new_attributes = {}
    attributes.each_pair do |key,value|
      if key.is_a?(::DataMapper::Associations::Relationship)
        new_attributes[key] = value
      elsif V1::Atm.properties[key.to_sym] && value
        case V1::Atm.properties[key.to_sym].primitive.name
        when 'Integer'
          new_attributes[key.to_sym] = value.blank? ? nil : value.to_i
        when 'Float'
          new_attributes[key.to_sym] = value.blank? ? nil : value.to_f
        when 'String'
          new_attributes[key.to_sym] = value.nil? ? nil : value.to_s
        when 'Time'
          new_attributes[key.to_sym] = value.blank? ? nil : value.to_time
        when 'Date'
          new_attributes[key.to_sym] = value.blank? ? nil : value.to_date
        when 'Array'
          new_attributes[key.to_sym] = value.blank? ? nil : value.to_a
        when 'TrueClass'
          new_attributes[key.to_sym] = ( value.blank? ? nil : value )
        when 'BSON::ObjectId'
          new_attributes[key.to_sym] = value.blank? ? nil : BSON::ObjectId.from_string(value.to_s)
        else
          new_attributes[key.to_sym] = (value.is_a?(V1::Atm.properties[key.to_sym].primitive) ? value : nil )
        end
      else
        new_attributes[key.to_sym] = value
      end
    end
    new_attributes
  end

  # Scopes for data access
  class << self
    def exact_match(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      attributes.each_pair do |name, value|
        scope = scope.all(name => value)
      end

      scope = scope.all(:order => [:id.asc])

      scope = scope.all(offset: offset.to_i) if offset
      scope = scope.all(limit: limit.to_i) if limit

      scope
    end

    def count(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      attributes.each_pair do |name, value|
        scope = scope.all(name => value)
      end

      scope = scope.count

      scope
    end

    def count_exact_match(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      attributes.each_pair do |name, value|
        scope = scope.all(name => value)
      end

      scope = scope.count

      scope
    end

    def filter_by_postal_code(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      scope = scope & all(:'parameter_postal_code' => attributes.with_indifferent_access[:parameter_postal_code])
      if !attributes.with_indifferent_access[:parameter_country].blank?
        scope = scope & all(:'parameter_country' => attributes.with_indifferent_access[:parameter_country])
      end

      scope = scope.all(:order => [:id.asc])

      scope = scope.all(offset: offset.to_i) if offset
      scope = scope.all(limit: limit.to_i) if limit

      scope
    end

    def filter_by_city(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      scope = scope & all(:'parameter_city' => attributes.with_indifferent_access[:parameter_city])
      if !attributes.with_indifferent_access[:parameter_country_subdivision].blank?
        scope = scope & all(:'parameter_country_subdivision' => attributes.with_indifferent_access[:parameter_country_subdivision])
      end

      scope = scope & all(:'parameter_country' => attributes.with_indifferent_access[:parameter_country])
      scope = scope.all(:order => [:id.asc])

      scope = scope.all(offset: offset.to_i) if offset
      scope = scope.all(limit: limit.to_i) if limit

      scope
    end

    def filter_by_geo_location(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      scope = scope & all(:'parameter_latitude' => attributes.with_indifferent_access[:parameter_latitude])
      scope = scope & all(:'parameter_longitude' => attributes.with_indifferent_access[:parameter_longitude])
      if !attributes.with_indifferent_access[:parameter_radius].blank?
        scope = scope & all(:'parameter_radius' => attributes.with_indifferent_access[:parameter_radius])
      end

      if !attributes.with_indifferent_access[:parameter_distance_unit].blank?
        scope = scope & all(:'parameter_distance_unit' => attributes.with_indifferent_access[:parameter_distance_unit])
      end

      scope = scope.all(:order => [:id.asc])

      scope = scope.all(offset: offset.to_i) if offset
      scope = scope.all(limit: limit.to_i) if limit

      scope
    end
  end




  # Add lifecycle hook methods to model lifecycle
  # model type: datamapper

  # Define lifecycle hook methods





  def assign_attributes(values, options = {})
    sanitize_for_mass_assignment(values, options[:as]).each do |k, v|
      send("#{k}=", v)
    end
  end



  def self.backing_storage
    :datamapper
  end

  include V1::Custom::Atm
end
