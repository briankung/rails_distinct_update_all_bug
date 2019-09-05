require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  test "update_all on distinct on (attribute) updates only distinct records" do
    ["1 Infinite Loop ", "1 Microsoft Way", "123 Penny Lane"].each do |address|
      10.times { Building.create(address: address, updated: false) }
    end

    distincts = Building.select("DISTINCT ON (address) *")
    number_of_buildings = Building.count
    number_selected = distincts.length
    number_updated = distincts.update_all(updated: true)

    refute_equal(number_selected, number_of_buildings)
    refute_equal(number_updated, number_of_buildings)
    refute(Building.pluck(:updated).all?)
  end
end
