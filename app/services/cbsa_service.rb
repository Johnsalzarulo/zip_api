class CbsaService
  include ImportHelper

  def initialize(cbsa)
    @cbsa = cbsa
  end

  def perform
    @csv = get_csv("public/cbsa_to_msa.csv")
    row = search_by_cbsa(@cbsa)
    if row.blank?
      row = search_by_mdiv(@cbsa)
    end
    return row_not_found if row.blank?
    hash = row_to_hash(row)
  end


  private

  def row_not_found
    {
      MSANAME: "N/A",
      POPESTIMATE2014: "N/A",
      POPESTIMATE2015: "N/A",
    }
  end

  def search_by_cbsa(cbsa)
    @csv.select { |row| row['CBSA'] == @cbsa }
  end

  def search_by_mdiv(cbsa)
    @csv.select { |row| row['MDIV'] == @cbsa }
  end

  def row_to_hash(row)
    {
      MSANAME: row[0]["NAME"],
      POPESTIMATE2014: row[0]["POPESTIMATE2014"],
      POPESTIMATE2015: row[0]["POPESTIMATE2015"],
    }
  end
end
