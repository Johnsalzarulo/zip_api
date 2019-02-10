require 'test_helper'
class CbsaServiceTest < ActiveSupport::TestCase

  test "Given 37100 results are returned on first lookup" do
    cbsa_service = CbsaService.new("37100").perform
    assert cbsa_service[:MSANAME] == "Oxnard-Thousand Oaks-Ventura, CA"
  end

  test "Given 31084 search is re-run for column 2 (MDIV)" do
    cbsa_service = CbsaService.new("31084").perform
    assert cbsa_service[:MSANAME] == "Los Angeles-Long Beach-Glendale, CA"
  end

  test "Given 00000 search is returned N/A" do
    cbsa_service = CbsaService.new("00000").perform
    assert cbsa_service[:MSANAME] == "N/A"
  end

end
