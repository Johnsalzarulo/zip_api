class ZipService
  include ImportHelper

  def initialize(zip)
    @zip = zip
  end

  def perform
    csv = get_csv("public/zip_to_cbsa.csv")
    row = csv.select { |row| row['ï»¿ZIP'] == @zip }
    row
  end

#   csv.select { |row| row['GENDER'] == 'MALE' }
# csv.select { |row| row['GENDER'] == 'MALE' || row['SALARY'] >= 10000 }

  private

end
