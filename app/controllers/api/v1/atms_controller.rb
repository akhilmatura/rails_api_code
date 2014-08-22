class Api::V1::AtmsController < Api::ApiController
  resource_description do
    name 'V1::Atms'
    short 'V1::Atms'
    path '/v1/atms.json'
    version '1'
    formats ['json']
    param :id, String, :desc => "V1::Atm ID", :required => false
    param :atm, Hash, :desc => "V1::Atm parameters for all methods" do

      param :id, String, :required => false,
      :desc => "id"

      param :access_fees, Integer, :required => false,
      :desc => "access_fees"

      param :address, Hash, :required => false,
      :desc => "address"

      param :address_line_one, String, :required => false,
      :desc => "address_line_one"

      param :address_line_two, String, :required => false,
      :desc => "address_line_two"

      param :availability, String, :required => false,
      :desc => "availability"

      param :camera, String, :required => false,
      :desc => "camera"

      param :city, String, :required => false,
      :desc => "city"

      param :country_code, String, :required => false,
      :desc => "country_code"

      param :country_name, String, :required => false,
      :desc => "country_name"

      param :country_subdivision_code, String, :required => false,
      :desc => "country_subdivision_code"

      param :country_subdivision_name, String, :required => false,
      :desc => "country_subdivision_name"

      param :distance, Float, :required => false,
      :desc => "distance"

      param :distance_unit, String, :required => false,
      :desc => "distance_unit"

      param :handicap_accessible, String, :required => false,
      :desc => "handicap_accessible"

      param :latitude, Float, :required => false,
      :desc => "latitude"

      param :location, Hash, :required => false,
      :desc => "location"

      param :longitude, Float, :required => false,
      :desc => "longitude"

      param :name, String, :required => false,
      :desc => "name"

      param :parameter_city, String, :required => false,
      :desc => "parameter_city"

      param :parameter_country, String, :required => false,
      :desc => "parameter_country"

      param :parameter_country_subdivision, String, :required => false,
      :desc => "parameter_country_subdivision"

      param :parameter_distance_unit, String, :required => false,
      :desc => "parameter_distance_unit"

      param :parameter_latitude, Float, :required => false,
      :desc => "parameter_latitude"

      param :parameter_longitude, Float, :required => false,
      :desc => "parameter_longitude"

      param :parameter_postal_code, String, :required => false,
      :desc => "parameter_postal_code"

      param :parameter_radius, Integer, :required => false,
      :desc => "parameter_radius"

      param :postal_code, String, :required => false,
      :desc => "postal_code"

      param :shared_deposit, String, :required => false,
      :desc => "shared_deposit"

      param :sponsor, String, :required => false,
      :desc => "sponsor"

      param :support_emv, Integer, :required => false,
      :desc => "support_emv"

      param :surcharge_free_alliance, String, :required => false,
      :desc => "surcharge_free_alliance"

    end
    description <<-DOC
    V1::Atms
    DOC
  end
  respond_to :json

  protect_from_forgery :except => [:create, :update, :destroy]

  # GET /atms.json
  api :GET, "/v1/atms.json", "Show all atms based on a query scope"
  def index
    scope = params[:scope] || 'all'
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless authorized_for_scope?(scope)
    @atms = scope_named(scope)
    respond_with @atms
  end

  # GET /atms/1.json
  api :GET, "/v1/atms/:id.json", "Show atm"
  def show
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_read?

    @atm = scope_for_read_finder.get((params['id'] || params[:id]))

    respond_with @atm
  end

  # GET /atms/new.json
  api :GET, "/v1/atms/new.json", "Instantiate a new atm"
  def new
    @atm = V1::Atm.new
    respond_with @atm
  end

  # POST /atms.json
  api :POST, "/v1/atms.json", "Create a new atm"
  def create
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_create?
    @atm = scope_for_create_finder.new(params[:atm], as: :"#{current_user_role} on create")
    @atm.save
    respond_with @atm
  end

  # PUT /atms/1.json
  api :PUT, "/v1/atms/:id.json", "Update an existing atm"
  def update
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_update?

    @atm = scope_for_update_finder.get((params['id'] || params[:id]))
    @atm.update(params[:atm], as: :"#{current_user_role} on update")

    respond_with @atm
  end

  # DELETE /atms/1.json
  api :DELETE, "/v1/atms/:id.json", "Delete an existing atm"
  def destroy
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_delete?

    @atm = scope_for_delete_finder.get((params['id'] || params[:id]))

    @atm.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  protected
  def scope_named(name)
    scope = 'all' unless ::V1::Atm.respond_to?(name)
    if name == 'all'

      scope = ::V1::Atm.all
      scope = scope.all(offset: params[:offset].to_i) if params[:offset]
      scope = scope.all(limit: params[:limit].to_i) if params[:limit]

    elsif name == 'count'
      scope = ::V1::Atm.count
    else
      query_params = params[:query].is_a?(String) ? ( JSON.parse(params[:query]) rescue nil ) : params[:query]
      scope = ::V1::Atm.send(name, (query_params || {}), {}, params[:offset], params[:limit])
    end
    scope
  end

  # Overriding respond_with to perform field level authorization for reading fields.
  def respond_with(*resources, &block)
    replacement = nil
    resources.each do |resource|
      if resource.respond_to?(:each)
        replacement = []
        resource.each do |instance|
          replacement << scrubbed_instance(instance)
        end
      elsif resource.respond_to?(:attributes)
        replacement = scrubbed_instance(resource)
      else
        replacement = resource
      end
    end

    super(replacement, :location => nil)
  end

  def scrubbed_instance(instance)
    instance.attributes.select{|attribute| [:'id', :'access_fees', :'address', :'address_line_one', :'address_line_two', :'availability', :'camera', :'city', :'country_code', :'country_name', :'country_subdivision_code', :'country_subdivision_name', :'distance', :'distance_unit', :'handicap_accessible', :'latitude', :'location', :'longitude', :'name', :'parameter_city', :'parameter_country', :'parameter_country_subdivision', :'parameter_distance_unit', :'parameter_latitude', :'parameter_longitude', :'parameter_postal_code', :'parameter_radius', :'postal_code', :'shared_deposit', :'sponsor', :'support_emv', :'surcharge_free_alliance'].include?(attribute) }.each do |attribute, value|
      instance.send("#{attribute}=", nil) unless authorized_to_read_field?(attribute)
    end
    instance
  end

  def requires_authentication?
    false
  end

  def authenticated?
    requires_authentication? ? current_user_role != "Unauthenticated Default": true
  end


  def can_read?

    case current_user_role

    when "Unauthenticated Default"
      true

    else
      false
    end

  end

  def scope_for_read_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Atm


    else
      ::V1::Atm
    end

  end

  def can_create?

    case current_user_role

    when "Unauthenticated Default"
      false

    else
      false
    end

  end

  def scope_for_create_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Atm


    else
      ::V1::Atm
    end

  end

  def can_update?

    case current_user_role

    when "Unauthenticated Default"
      false

    else
      false
    end

  end

  def scope_for_update_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Atm


    else
      ::V1::Atm
    end

  end

  def can_delete?

    case current_user_role

    when "Unauthenticated Default"
      false

    else
      false
    end

  end

  def scope_for_delete_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Atm


    else
      ::V1::Atm
    end

  end


  def authorized_for_scope?(scope_name)

    case current_user_role

    when "Unauthenticated Default"
      ["filter_by_postal_code", "filter_by_city", "filter_by_geo_location"].include?(scope_name)

    else
      false
    end

  end

  def authorized_to_read_field?(field_name)

    case current_user_role

    when "Unauthenticated Default"
      ["id", "access_fees", "address", "address_line_one", "address_line_two", "availability", "camera", "city", "country_code", "country_name", "country_subdivision_code", "country_subdivision_name", "distance", "distance_unit", "handicap_accessible", "latitude", "location", "longitude", "name", "postal_code", "shared_deposit", "sponsor", "support_emv", "surcharge_free_alliance"].include?(field_name.to_s)

    else
      false
    end

  end

  include Api::V1::Custom::AtmsController
end
