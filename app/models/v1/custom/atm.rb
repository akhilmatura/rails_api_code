# Extend your models with custom code here. This module will be included at the end of the generated model.
# The same module is included in all model versions, but you can check for versions by inspecting the model's class.
# Otherwise, if you have version-specific needs, you can edit the specific version model directly; it won't be overwritten.
#
# ActiveSupport::Concern may make extending the model easier. Read more here: http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
module V1::Custom::Atm
  extend ActiveSupport::Concern

  included do
    #these transient fields are used to take hash fields returned by the ATM Location services api and assign to object fields so they are easier to consume by the mobile app sdk.
    attr_writer :address, :address_line_one, :address_line_two, :distance, :distance_unit, :name, :latitude, :longitude, :city, :postal_code, :country_subdivision_code, :country_subdivision_name, :country_code, :country_name

    #overwrite custom query scope to set offset and limit values when calling MasterCard API
    class_eval do
      def self.filter_by_postal_code(attributes={}, user_attributes={}, offset = nil, limit = nil)
        scope = self.all

        scope = scope & all(:'parameter_postal_code' => attributes.with_indifferent_access[:parameter_postal_code])
        #country is required if not passing in latitude and longitude so default to USA if not passed in
        if attributes[:parameter_country].blank?
          scope = scope & all(:'parameter_country' => "USA")
        else
          scope = scope & all(:'parameter_country' => attributes.with_indifferent_access[:parameter_country])
        end
        #MasterCard API only returns 25 records at a time
        limit = 25 unless limit
        offset = 0 unless offset
        scope = scope.all(offset: offset.to_i) if offset
        scope = scope.all(limit: limit.to_i) if limit

        scope
      end

      def self.filter_by_city(attributes={}, user_attributes={}, offset = nil, limit = nil)
        scope = self.all

        scope = scope & all(:'parameter_city' => attributes.with_indifferent_access[:parameter_city])
        scope = scope & all(:'parameter_country_subdivision' => attributes.with_indifferent_access[:parameter_country_subdivision])
        #country is required if not passing in latitude and longitude so default to USA if not passed in
        if attributes[:parameter_country].blank?
          scope = scope & all(:'parameter_country' => "USA")
        else
          scope = scope & all(:'parameter_country' => attributes.with_indifferent_access[:parameter_country])
        end
        #MasterCard API only returns 25 records at a time
        limit = 25 unless limit
        offset = 0 unless offset
        scope = scope.all(offset: offset.to_i) if offset
        scope = scope.all(limit: limit.to_i) if limit

        scope
      end

    end

  end

  #this methods take the hash values under Location and assign to a transient field.  This is repeated for other fields.  The transient fields can be referenced in the mobile sdk.
  def address
    self.location.first["address"] rescue nil
  end

  def city
    self.location.first["address"]["city"] rescue nil
  end

  def distance
    self.location.first["distance"] rescue nil
  end

  def address_line_one
    self.location.first["address"]["line1"] rescue nil
  end

  def address_line_two
    self.location.first["address"]["line2"] rescue nil
  end

  def distance_unit
    self.location.first["distance_unit"] rescue nil
  end

  def name
    self.location.first["name"] rescue nil
  end

  def postal_code
    self.location.first["address"]["postal_code"] rescue nil
  end

  def country_subdivision_code
    self.location.first["address"]["country_subdivision"]["code"] rescue nil
  end

  def country_subdivision_name
    self.location.first["address"]["country_subdivision"]["name"] rescue nil
  end

  def country_code
    self.location.first["address"]["country"]["code"] rescue nil
  end

  def country_name
    self.location.first["address"]["country"]["name"] rescue nil
  end

  def latitude
    self.location.first["point"]["latitude"].to_f rescue nil
  end

  def longitude
    self.location.first["point"]["longitude"].to_f rescue nil
  end

  def as_json(options={})
    result = super(options.merge(methods: [:address, :address_line_one, :address_line_two, :distance, :distance_unit, :name, :latitude, :longitude, :city, :postal_code, :country_subdivision_code, :country_subdivision_name, :country_code, :country_name]))

    #clear out location field to reduce payload
    result[:location] = nil
    result
  end

  module ClassMethods
  end

end
