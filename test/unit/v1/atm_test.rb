require 'test_helper'

class V1::AtmTest < ActiveSupport::TestCase

  def cleanup

    V1::Atm.destroy
  end

  setup do
    cleanup

    @atm_relationship_hash = {}
    @atm = V1::Atm.new({:id=>"Odyssey excludes", :access_fees=>51, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Smirches inventorying", :address_line_two=>"Cablecasts syncing", :availability=>"Presuppositions unadulterated", :camera=>"Chits afterbirth", :city=>"Pummeling haggler", :country_code=>"Cuffs sturdiness", :country_name=>"Ornithologists wallops", :country_subdivision_code=>"Philanthropies worsts", :country_subdivision_name=>"Gravestone expeditionary", :distance=>3.0300408059174138, :distance_unit=>"Sensuously conservatories", :handicap_accessible=>"Galapagos stilettos", :latitude=>4.252887410993507, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>22.320855393521057, :name=>"Kenisha Jones", :parameter_city=>"Czechoslovakian malapropisms", :parameter_country=>"Sticklebacks girths", :parameter_country_subdivision=>"Dictatorships tempi", :parameter_distance_unit=>"Masturbated subscribed", :parameter_latitude=>61.01939268323223, :parameter_longitude=>20.198273460760642, :parameter_postal_code=>"Disrespecting fertilization", :parameter_radius=>71, :postal_code=>"Orchestrations spanner", :shared_deposit=>"Weaved magistrates", :sponsor=>"Mountaineering overspecialize", :support_emv=>54, :surcharge_free_alliance=>"Tiara Sheri"}, as: :"System Admin")

    @atm.save

    @atm = V1::Atm.new({:id=>"Deliriums pronounce", :access_fees=>70, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Sprite unfriendlier", :address_line_two=>"Campaniles constrain", :availability=>"Generalizes house", :camera=>"Firehouses coefficients", :city=>"Degenerated disperses", :country_code=>"Gooiest imperious", :country_name=>"Countersigned overshot", :country_subdivision_code=>"Dawdles opinionated", :country_subdivision_name=>"Underpaying woolly", :distance=>13.168829776738207, :distance_unit=>"Vaults Transcaucasia", :handicap_accessible=>"Nantucket sanctimonious", :latitude=>99.16337717311686, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>91.69641531499622, :name=>"Delsie Boehm", :parameter_city=>"Exemplification anthropocentric", :parameter_country=>"Physiological transitive", :parameter_country_subdivision=>"Prepackage bills", :parameter_distance_unit=>"Junket prosy", :parameter_latitude=>5.115934878947856, :parameter_longitude=>19.80865645950937, :parameter_postal_code=>"Existentialism smarts", :parameter_radius=>14, :postal_code=>"Fitted gratuitous", :shared_deposit=>"Strangulated accelerates", :sponsor=>"Straggle interconnection", :support_emv=>17, :surcharge_free_alliance=>"Partisanship disown"}, as: :"System Admin")

    @atm.save

    @atm = V1::Atm.new({:id=>"Blanker vandalized", :access_fees=>2, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Oliver Meadows", :address_line_two=>"Participators monogamy", :availability=>"Presuppositions regress", :camera=>"Unparalleled escapists", :city=>"Stagnation propositioning", :country_code=>"Misconception Sargasso", :country_name=>"Expedited undistinguished", :country_subdivision_code=>"Drouths Berlioz", :country_subdivision_name=>"Evicted reoccurred", :distance=>87.31661887389998, :distance_unit=>"Washingtonians analyticalally", :handicap_accessible=>"Disordering werewolves", :latitude=>53.969102115125864, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>38.863895546358876, :name=>"Norris McCullough", :parameter_city=>"Leann monsignori", :parameter_country=>"Individualists destructiveness", :parameter_country_subdivision=>"Namath pomades", :parameter_distance_unit=>"Widowed pepperonis", :parameter_latitude=>81.9425726996129, :parameter_longitude=>63.263244520454556, :parameter_postal_code=>"Canvased undisguised", :parameter_radius=>41, :postal_code=>"Incompetence palmy", :shared_deposit=>"Curry Boswell", :sponsor=>"Urban budgies", :support_emv=>26, :surcharge_free_alliance=>"Interconnection tribulation"}, as: :"System Admin")

    @atm.save



  end

  teardown do
    cleanup
  end

  test "validity of create for V1::Atm" do
    # Instantiate and save the model.
    atm = V1::Atm.new( {:id=>"Peptics concession", :access_fees=>81, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Unsubstantiated restocks", :address_line_two=>"Patrons disappointingly", :availability=>"Imperceptible particularize", :camera=>"Station flammability", :city=>"Monotonously byproducts", :country_code=>"Tendentiousness gentlest", :country_name=>"Ecumenically contraception", :country_subdivision_code=>"Subservient carjacking", :country_subdivision_name=>"Lanolin Libyan", :distance=>60.168819884990825, :distance_unit=>"Paperback underscoring", :handicap_accessible=>"Garrulousness corresponded", :latitude=>5.027521358040907, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>58.03100077522831, :name=>"Ranee Cormier", :parameter_city=>"Perfectionism munches", :parameter_country=>"Housebreaking hothead", :parameter_country_subdivision=>"Incrusting casters", :parameter_distance_unit=>"Disintegration armpit", :parameter_latitude=>76.96467786699615, :parameter_longitude=>19.189935055717473, :parameter_postal_code=>"Benevolence anarchists", :parameter_radius=>40, :postal_code=>"Dismissive indeterminable", :shared_deposit=>"Imperturbable snaking", :sponsor=>"Expansive fingering", :support_emv=>58, :surcharge_free_alliance=>"Countermand goals"}, as: :"System Admin" )

    # Test fails if the model if 'true' was not returned.
    assert( atm.save )

    # check the see if the number of models has increased by 1.
    assert( V1::Atm.count == 4 )
  end

  test "validity of read for V1::Atm" do
    assert( V1::Atm.count == 3 )
  end

  test "validity of update for V1::Atm" do
    assert( V1::Atm.first.save )
  end

  test "validity of delete for V1::Atm" do
    atm = V1::Atm.first
    atm.destroy
    assert( V1::Atm.count == 2 )
  end
end
