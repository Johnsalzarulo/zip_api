require "test_helper"
class SearchesControllerTest < ActionDispatch::IntegrationTest

  test "Basic Index" do
    get searches_path,
        xhr: true
    response_json = JSON.parse(response.body)
    assert response.status == 200
    assert response.status == 200
    assert response_json.to_s.include? "Welcome"
  end

  test "Search for 93001 returns valid result" do
    response_json = post_search("93001")
    assert response.status == 200
    assert response_json["data"]["CBSA"] == "37100"
  end

  test "Search for 00000 should have no result" do
    response_json = post_search("00000")
    assert response.status == 200
    assert response_json["data"]["CBSA"] == "NOT FOUND"
  end

  test "Search for 02564 should be looked up in the csba_to_msa" do
    response_json = post_search("02564")
    assert response_json["data"]["CBSA"] == "99999"
  end

  test "Search for 90266 should be looked up in the csba_to_msa" do
    response_json = post_search("90266")
    assert response_json["data"]["CBSA"] == "31084"
    # Example: For zip code 90266, the CBSA in the first file is 31084. This value is not present in Column 1 (CBSA), but only in Column 2 (MDIV) of the second file. The corresponding CBSA value is actually 31080 and you would use that to find the row where `LSAD` = `Metropolitan Statistical Area`.*
  end

  def post_search(zip)
    post searches_path,
        params: { "zip": zip },
        xhr: true
    JSON.parse(response.body)
  end

end
