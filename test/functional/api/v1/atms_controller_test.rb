require 'test_helper'

class Api::V1::AtmsControllerTest < ActionController::TestCase

  def cleanup

    V1::Atm.destroy
  end

  setup do
    cleanup

    @atm_relationship_hash = {}
    @atm = V1::Atm.new({:id=>"Gesticulation vulnerabilities", :access_fees=>96, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Genus backpedal", :address_line_two=>"Entrepreneurial caricaturing", :availability=>"Imperturbable countertenors", :camera=>"Advertise parenthetically", :city=>"Jewel picturesque", :country_code=>"Phantasmagoria mispronouncing", :country_name=>"Lathe Ypres", :country_subdivision_code=>"Hypoallergenic underclass", :country_subdivision_name=>"Multinationals goldenrod", :distance=>87.75621992370017, :distance_unit=>"Resells Leavenworth", :handicap_accessible=>"Curtailments quartermasters", :latitude=>48.935276793155325, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>24.575823907272593, :name=>"Karissa Gibson", :parameter_city=>"Admonishments proclamations", :parameter_country=>"Procter Constantinople", :parameter_country_subdivision=>"Bleaching Pavlova", :parameter_distance_unit=>"Recuperation typewrites", :parameter_latitude=>73.81563497724487, :parameter_longitude=>98.55967470279019, :parameter_postal_code=>"Prelude intercollegiate", :parameter_radius=>34, :postal_code=>"Detract Lamarck", :shared_deposit=>"Cawed obstructiveness", :sponsor=>"Demeaned Dover", :support_emv=>84, :surcharge_free_alliance=>"Attended appositives"}, as: :"System Admin")

    @atm.save

    @atm = V1::Atm.new({:id=>"Grunt emigrant", :access_fees=>51, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Tipsier escutcheon", :address_line_two=>"Fastness healthfully", :availability=>"Vulnerabilities saner", :camera=>"Reminiscing deans", :city=>"Gemstone extemporizes", :country_code=>"Apartment soliloquies", :country_name=>"Boozed redskin", :country_subdivision_code=>"Determiner overdrawn", :country_subdivision_name=>"Headset dreamland", :distance=>51.11892393243707, :distance_unit=>"Hemorrhaged blameless", :handicap_accessible=>"Jujube wisher", :latitude=>31.702894904478136, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>15.125379023423877, :name=>"Alfonzo Gerlach", :parameter_city=>"Dreamland emended", :parameter_country=>"Grope enriches", :parameter_country_subdivision=>"Podgorica automatically", :parameter_distance_unit=>"Advisability slackened", :parameter_latitude=>95.90515657033737, :parameter_longitude=>14.229263293965827, :parameter_postal_code=>"Plusher brainteasers", :parameter_radius=>19, :postal_code=>"Greater idled", :shared_deposit=>"Bracket medalists", :sponsor=>"Helicon gingko", :support_emv=>19, :surcharge_free_alliance=>"Encyclopaedias schoolteachers"}, as: :"System Admin")

    @atm.save

    @atm = V1::Atm.new({:id=>"Congratulation efficaciously", :access_fees=>68, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Nourishes indulgently", :address_line_two=>"Smooch combine", :availability=>"Circumstances confrontations", :camera=>"Floozie unbeknown", :city=>"Pinpoint proportioning", :country_code=>"Disinterestedly chanced", :country_name=>"Slits spinal", :country_subdivision_code=>"Legation candidly", :country_subdivision_name=>"Hanky oxfords", :distance=>7.527148408898373, :distance_unit=>"Whore centrifuges", :handicap_accessible=>"Demagnetization narcs", :latitude=>88.99016712921531, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>74.34955204301994, :name=>"Elliott Hoppe", :parameter_city=>"Infectiousness cultivators", :parameter_country=>"Afterlife elaborateness", :parameter_country_subdivision=>"Fresh bookshelves", :parameter_distance_unit=>"Proboscides disputation", :parameter_latitude=>53.24476479883881, :parameter_longitude=>23.31884771278321, :parameter_postal_code=>"Wavers imaginable", :parameter_radius=>100, :postal_code=>"Unconcernedly authenticity", :shared_deposit=>"Nefertiti bookmakers", :sponsor=>"Cupid fibroid", :support_emv=>60, :surcharge_free_alliance=>"Batsman electrodynamics"}, as: :"System Admin")

    @atm.save




  end

  teardown do
    cleanup

  end





  test "should get index of atms for Unauthenticated Default" do

    get :index, format: :json

    assert_response :forbidden

  end

  test "should get new atm for Unauthenticated Default" do

    get :new, format: :json
    assert_response :success
  end

  test "should create atm for Unauthenticated Default" do

    Api::V1::AtmsController.any_instance.stubs(:scope_for_create_finder).returns(::V1::Atm)


    post :create, atm: {:id=>"Eleventh convalescences", :access_fees=>43, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Peters patronizingly", :address_line_two=>"Trains circlet", :availability=>"Gabled familiarizing", :camera=>"Penitentiaries callipered", :city=>"Explorations advantageously", :country_code=>"Ratted vesting", :country_name=>"Conservative Foucault", :country_subdivision_code=>"Decaffeinating Albee", :country_subdivision_name=>"Despicable revolutionizes", :distance=>74.73461779668318, :distance_unit=>"Conservatories personification", :handicap_accessible=>"Disintegrates fishwife", :latitude=>90.3450636185339, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>89.23385580012919, :name=>"Basilia Barrows", :parameter_city=>"Hardheaded rebroadcasting", :parameter_country=>"Synthesizes abominably", :parameter_country_subdivision=>"Attitudinizes peasants", :parameter_distance_unit=>"Teacup percentiles", :parameter_latitude=>79.60838919469393, :parameter_longitude=>49.723106089887004, :parameter_postal_code=>"Investigator direst", :parameter_radius=>1, :postal_code=>"Micronesian pollute", :shared_deposit=>"Prejudices developers", :sponsor=>"Misdirecting cooling", :support_emv=>56, :surcharge_free_alliance=>"Mnemosyne instrumentalist"}.merge(@atm_relationship_hash), format: :json
    assert_response :forbidden

  end

  test "should show atm for Unauthenticated Default" do

    Api::V1::AtmsController.any_instance.stubs(:scope_for_read_finder).returns(::V1::Atm)
    get :show, id: @atm.id, format: :json

    assert_response :success

  end

  test "should update atm for Unauthenticated Default" do

    Api::V1::AtmsController.any_instance.stubs(:scope_for_update_finder).returns(::V1::Atm)
    put :update, id: @atm.id, atm: {:id=>"Morons conditionals", :access_fees=>21, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Distastefully Hewitt", :address_line_two=>"Sledgehammering Sloane", :availability=>"Discontinues individualistic", :camera=>"Photojournalism associate", :city=>"Unburdening understandingly", :country_code=>"Multiplications weightlessness", :country_name=>"Afterward unsubstantiated", :country_subdivision_code=>"Liquidator petitioner", :country_subdivision_name=>"Quartermasters symbols", :distance=>21.325062672939836, :distance_unit=>"Abstractedly kleptomaniacs", :handicap_accessible=>"Painfullest tallied", :latitude=>93.03305025966492, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>30.684938678768873, :name=>"Wiley Dach", :parameter_city=>"Sneakiest spiky", :parameter_country=>"Transitioned webmistresses", :parameter_country_subdivision=>"Irretrievably Melba", :parameter_distance_unit=>"Highways slovenliness", :parameter_latitude=>22.350653761615266, :parameter_longitude=>28.809407932224836, :parameter_postal_code=>"Commercializes surlier", :parameter_radius=>64, :postal_code=>"Pastures Gorky", :shared_deposit=>"Discrepancies healthfulness", :sponsor=>"Inapplicable impolitely", :support_emv=>69, :surcharge_free_alliance=>"Unveil weatherproofing"}, format: :json

    assert_response :forbidden

  end

  test "should destroy atm for Unauthenticated Default" do

    Api::V1::AtmsController.any_instance.stubs(:scope_for_delete_finder).returns(::V1::Atm)

    delete :destroy, id: @atm.id, format: :json
    assert_response :forbidden

  end




end
