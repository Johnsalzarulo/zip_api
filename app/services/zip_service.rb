class ZipService
  include ImportHelper

  def initialize(zip)
    @zip = zip
  end

  def perform
    csv = get_csv("public/zip_to_cbsa.csv")
    row = csv.select { |row| row['ï»¿ZIP'] == @zip }
    row_to_json(row)
  end

  def row_to_json(row)
    {
     "ZIP": row[0]["ï»¿ZIP"],
     "MSA": row[0]["ï»¿MSA"],
     "CBSA": row[0]["CBSA"]
   }
  end

#   csv.select { |row| row['GENDER'] == 'MALE' }
# csv.select { |row| row['GENDER'] == 'MALE' || row['SALARY'] >= 10000 }

  private

end
