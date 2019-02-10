require "test_helper"
class SearchesControllerTest < ActionDispatch::IntegrationTest

  test "Basic Index" do
    get searches_path,
        xhr: true
    response_json = JSON.parse(response.body)
    assert response.status == 200
    assert response_json.to_s.include? "Welcome"
  end

  test "Search for 93001 returns result" do
    post searches_path,
        params: { "zip": "93001" },
        xhr: true
    response_json = JSON.parse(response.body)
    assert response.status == 200
    assert response_json.to_s.include? "Zip code found"
  end

  test "Search for 32003 returns result" do
    post searches_path,
        params: { "zip": "32003" },
        xhr: true
    response_json = JSON.parse(response.body)
    assert response.status == 200
    assert response_json.to_s.include? "Zip code found"
  end

  test "Search for 88338 returns result" do
    post searches_path,
        params: { "zip": "88338" },
        xhr: true
    response_json = JSON.parse(response.body)
    assert response.status == 200
    assert response_json.to_s.include? "Zip code found"
  end


  test "Search for 99999 should have no result" do
    post searches_path,
        params: { "zip": "99999" },
        xhr: true
    response_json = JSON.parse(response.body)
    assert response.status == 200
    assert response_json.to_s.include? "Zip code found"
  end
end
