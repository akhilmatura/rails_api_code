require 'test_helper'

class V1::AtmQueryScopeTest < ActiveSupport::TestCase

  def cleanup

    V1::Atm.destroy
  end

  setup do
    cleanup

    @atm_relationship_hash = {}
    @atm = V1::Atm.new({:id=>"Infinite profitability", :access_fees=>32, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Retrospectively entangles", :address_line_two=>"Inextricable circuit", :availability=>"Agribusiness molehills", :camera=>"Mainframe relaxes", :city=>"Invulnerability attributively", :country_code=>"Bluebottles technologists", :country_name=>"Unenforceable astrophysicists", :country_subdivision_code=>"Fluctuations leaped", :country_subdivision_name=>"Diabetes cowlings", :distance=>64.15395036328533, :distance_unit=>"Perfumery workweek", :handicap_accessible=>"Tranquillizer Callas", :latitude=>25.519724236121405, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>14.492389765968852, :name=>"Erica Streich", :parameter_city=>"Traditionalist medications", :parameter_country=>"Sexists conceptualizing", :parameter_country_subdivision=>"Orphanages snoopers", :parameter_distance_unit=>"Restatements tobogganed", :parameter_latitude=>23.17408820779991, :parameter_longitude=>75.11637269798588, :parameter_postal_code=>"Pasteurization motionless", :parameter_radius=>43, :postal_code=>"Wider antidepressants", :shared_deposit=>"Recapture epileptics", :sponsor=>"Widowing Udall", :support_emv=>34, :surcharge_free_alliance=>"Quonset motor"}, as: :"System Admin")

    @atm.save

    @atm = V1::Atm.new({:id=>"Decontaminating unexceptionable", :access_fees=>29, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Tress premeditating", :address_line_two=>"Uncompromising choreographers", :availability=>"Individualism counterculture", :camera=>"Acrostic aphid", :city=>"Transplantation punishes", :country_code=>"Comforts contributing", :country_name=>"Rainbow electromagnets", :country_subdivision_code=>"Internationals laureates", :country_subdivision_name=>"Christensen intolerably", :distance=>66.40360145741876, :distance_unit=>"Editorialize indistinctness", :handicap_accessible=>"Recreation mortices", :latitude=>80.83746982139581, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>82.87038585739496, :name=>"Royal Huels", :parameter_city=>"Eighteenths discards", :parameter_country=>"Interpretations agitated", :parameter_country_subdivision=>"Congratulate coordinates", :parameter_distance_unit=>"Premeditates cataleptics", :parameter_latitude=>64.74416018773275, :parameter_longitude=>18.573678582996624, :parameter_postal_code=>"Millennial slated", :parameter_radius=>25, :postal_code=>"Misanthropy Charlottetown", :shared_deposit=>"Syntactically charted", :sponsor=>"Conciliates euphemistically", :support_emv=>62, :surcharge_free_alliance=>"Phonology vituperating"}, as: :"System Admin")

    @atm.save

    @atm = V1::Atm.new({:id=>"Unilaterally nervelessly", :access_fees=>82, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Dissembled androgynous", :address_line_two=>"Straitjacketing stuffs", :availability=>"Inactivity trainee", :camera=>"Cullen disturbingly", :city=>"Disenchanting illegitimacy", :country_code=>"Macaulay McCarthyism", :country_name=>"Bills mistletoe", :country_subdivision_code=>"Prevarication Copacabana", :country_subdivision_name=>"Kilobyte plunderer", :distance=>28.03699061369555, :distance_unit=>"Canute Bonner", :handicap_accessible=>"Debate kaleidoscopes", :latitude=>86.45784926544569, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>90.58064159660961, :name=>"Renetta Thiel", :parameter_city=>"Excommunicating firewater", :parameter_country=>"Imbued Beiderbecke", :parameter_country_subdivision=>"Dispassionately auditorium", :parameter_distance_unit=>"Superconductors peacekeeping", :parameter_latitude=>93.18393909529136, :parameter_longitude=>53.387513533729226, :parameter_postal_code=>"Prosperity mandolin", :parameter_radius=>10, :postal_code=>"Scatter recognizing", :shared_deposit=>"Hermaphrodites miscalculations", :sponsor=>"Embezzlement norms", :support_emv=>8, :surcharge_free_alliance=>"Conurbations chock"}, as: :"System Admin")

    @atm.save




  end

  teardown do
    cleanup
  end



  test "validity of all" do
    value = V1::Atm.all

    assert_not_nil(value.count)

  end



  test "validity of exact_match" do
    value = V1::Atm.exact_match

    assert_not_nil(value.count)

  end



  test "validity of count" do
    value = V1::Atm.count

    assert_not_nil(value)

  end



  test "validity of count_exact_match" do
    value = V1::Atm.count_exact_match

    assert_not_nil(value)

  end



  test "validity of filter_by_postal_code Field" do
    V1::Atm.destroy


    atm = V1::Atm.create({:id=>"Lateral schoolbooks", :access_fees=>49, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Incompatibles Nootka", :address_line_two=>"Kirchhoff seminar", :availability=>"Physiologist Massachusetts", :camera=>"Scrimmage kleptomaniac", :city=>"Lumberyard superficiality", :country_code=>"Blistered diversification", :country_name=>"Perspicacious versify", :country_subdivision_code=>"Hellions diagrammatic", :country_subdivision_name=>"Corral mincing", :distance=>61.40676976672248, :distance_unit=>"Algebraically threnody", :handicap_accessible=>"Weekending imperiousness", :latitude=>60.127539778792496, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>22.169989784523914, :name=>"Santo Stoltenberg", :parameter_city=>"Contortionists reconsidering", :parameter_country=>"Interrelation batons", :parameter_country_subdivision=>"Heels hypoglycemic", :parameter_distance_unit=>"Squinter idolater", :parameter_latitude=>62.28212287965442, :parameter_longitude=>94.8556622410742, :parameter_postal_code=>"Physicist emulated", :parameter_radius=>41, :postal_code=>"Cardin firebombing", :shared_deposit=>"Realistically conversations", :sponsor=>"Consolations indefatigably", :support_emv=>74, :surcharge_free_alliance=>"Evener disassembled"}, as: :"System Admin")


    atm = V1::Atm.create({:id=>"Lateral schoolbooks", :access_fees=>49, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Incompatibles Nootka", :address_line_two=>"Kirchhoff seminar", :availability=>"Physiologist Massachusetts", :camera=>"Scrimmage kleptomaniac", :city=>"Lumberyard superficiality", :country_code=>"Blistered diversification", :country_name=>"Perspicacious versify", :country_subdivision_code=>"Hellions diagrammatic", :country_subdivision_name=>"Corral mincing", :distance=>61.40676976672248, :distance_unit=>"Algebraically threnody", :handicap_accessible=>"Weekending imperiousness", :latitude=>60.127539778792496, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>22.169989784523914, :name=>"Santo Stoltenberg", :parameter_city=>"Contortionists reconsidering", :parameter_country=>"Interrelation batons", :parameter_country_subdivision=>"Heels hypoglycemic", :parameter_distance_unit=>"Squinter idolater", :parameter_latitude=>62.28212287965442, :parameter_longitude=>94.8556622410742, :parameter_postal_code=>"Physicist emulated", :parameter_radius=>41, :postal_code=>"Cardin firebombing", :shared_deposit=>"Realistically conversations", :sponsor=>"Consolations indefatigably", :support_emv=>74, :surcharge_free_alliance=>"Evener disassembled"}, as: :"System Admin")



    value = V1::Atm.filter_by_postal_code({:parameter_postal_code=>nil, :parameter_country=>nil}, {})

    assert_not_nil(value)

  end



  test "validity of filter_by_city Field" do
    V1::Atm.destroy


    atm = V1::Atm.create({:id=>"Mescaline Wilde", :access_fees=>50, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Semiautomatics novels", :address_line_two=>"Prefabricating landscaper", :availability=>"Permalloy statesmanlike", :camera=>"Misinterpreted nibbled", :city=>"Deodorizing stroking", :country_code=>"Turbulence symmetrical", :country_name=>"Dispensations Anthony", :country_subdivision_code=>"Slovak squared", :country_subdivision_name=>"Hurts Joule", :distance=>35.42293662160877, :distance_unit=>"Cosigner taxiing", :handicap_accessible=>"Plunders disbursements", :latitude=>6.082872951593448, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>85.08010595864047, :name=>"Jorge Dietrich", :parameter_city=>"Acclimatization tasty", :parameter_country=>"Juicier crackers", :parameter_country_subdivision=>"Discombobulated precociousness", :parameter_distance_unit=>"Twirl unceremoniously", :parameter_latitude=>10.467479534889724, :parameter_longitude=>62.55915881798608, :parameter_postal_code=>"Provable gores", :parameter_radius=>82, :postal_code=>"Tipped advocate", :shared_deposit=>"Larkspurs Netzahualcoyotl", :sponsor=>"Abloom dupes", :support_emv=>74, :surcharge_free_alliance=>"Heathenish Rebekah"}, as: :"System Admin")


    atm = V1::Atm.create({:id=>"Mescaline Wilde", :access_fees=>50, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Semiautomatics novels", :address_line_two=>"Prefabricating landscaper", :availability=>"Permalloy statesmanlike", :camera=>"Misinterpreted nibbled", :city=>"Deodorizing stroking", :country_code=>"Turbulence symmetrical", :country_name=>"Dispensations Anthony", :country_subdivision_code=>"Slovak squared", :country_subdivision_name=>"Hurts Joule", :distance=>35.42293662160877, :distance_unit=>"Cosigner taxiing", :handicap_accessible=>"Plunders disbursements", :latitude=>6.082872951593448, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>85.08010595864047, :name=>"Jorge Dietrich", :parameter_city=>"Acclimatization tasty", :parameter_country=>"Juicier crackers", :parameter_country_subdivision=>"Discombobulated precociousness", :parameter_distance_unit=>"Twirl unceremoniously", :parameter_latitude=>10.467479534889724, :parameter_longitude=>62.55915881798608, :parameter_postal_code=>"Provable gores", :parameter_radius=>82, :postal_code=>"Tipped advocate", :shared_deposit=>"Larkspurs Netzahualcoyotl", :sponsor=>"Abloom dupes", :support_emv=>74, :surcharge_free_alliance=>"Heathenish Rebekah"}, as: :"System Admin")



    value = V1::Atm.filter_by_city({:parameter_city=>nil, :parameter_country_subdivision=>nil, :parameter_country=>nil}, {})

    assert_not_nil(value)

  end



  test "validity of filter_by_geo_location Field" do
    V1::Atm.destroy


    atm = V1::Atm.create({:id=>"Antiseptically looses", :access_fees=>9, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Beauteously rajahs", :address_line_two=>"Doxologies futzed", :availability=>"Sheered disputations", :camera=>"Obtains marksmanship", :city=>"Adele croquet", :country_code=>"Butterscotch insurrectionist", :country_name=>"Degrades skinniness", :country_subdivision_code=>"Impenetrability personifying", :country_subdivision_name=>"Degenerate intravenously", :distance=>56.91194501940729, :distance_unit=>"Scheherazade pansy", :handicap_accessible=>"Supranational impressionable", :latitude=>67.31978521448532, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>15.214085743582734, :name=>"Corina Schimmel", :parameter_city=>"Ledger lacerating", :parameter_country=>"Carvings raglans", :parameter_country_subdivision=>"Index drinks", :parameter_distance_unit=>"Journalistic grandpa", :parameter_latitude=>24.2956194695891, :parameter_longitude=>43.80693608903452, :parameter_postal_code=>"Carriage embalmed", :parameter_radius=>95, :postal_code=>"Constitutionals nostalgia", :shared_deposit=>"Cuttlefishes doubloon", :sponsor=>"Stenographic caparisoning", :support_emv=>24, :surcharge_free_alliance=>"Archeologists conquistadores"}, as: :"System Admin")


    atm = V1::Atm.create({:id=>"Antiseptically looses", :access_fees=>9, :address=>{:one=>1, :two=>2, :three=>3}, :address_line_one=>"Beauteously rajahs", :address_line_two=>"Doxologies futzed", :availability=>"Sheered disputations", :camera=>"Obtains marksmanship", :city=>"Adele croquet", :country_code=>"Butterscotch insurrectionist", :country_name=>"Degrades skinniness", :country_subdivision_code=>"Impenetrability personifying", :country_subdivision_name=>"Degenerate intravenously", :distance=>56.91194501940729, :distance_unit=>"Scheherazade pansy", :handicap_accessible=>"Supranational impressionable", :latitude=>67.31978521448532, :location=>{:one=>1, :two=>2, :three=>3}, :longitude=>15.214085743582734, :name=>"Corina Schimmel", :parameter_city=>"Ledger lacerating", :parameter_country=>"Carvings raglans", :parameter_country_subdivision=>"Index drinks", :parameter_distance_unit=>"Journalistic grandpa", :parameter_latitude=>24.2956194695891, :parameter_longitude=>43.80693608903452, :parameter_postal_code=>"Carriage embalmed", :parameter_radius=>95, :postal_code=>"Constitutionals nostalgia", :shared_deposit=>"Cuttlefishes doubloon", :sponsor=>"Stenographic caparisoning", :support_emv=>24, :surcharge_free_alliance=>"Archeologists conquistadores"}, as: :"System Admin")



    value = V1::Atm.filter_by_geo_location({:parameter_latitude=>nil, :parameter_longitude=>nil, :parameter_radius=>nil, :parameter_distance_unit=>nil}, {})

    assert_not_nil(value)

  end


end
