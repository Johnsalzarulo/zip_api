class ZipService
  include ImportHelper

  def initialize(zip)
    @zip = zip
  end

  def perform
    get_csv
  end

#   csv.select { |row| row['GENDER'] == 'MALE' }
# csv.select { |row| row['GENDER'] == 'MALE' || row['SALARY'] >= 10000 }

  private

end
