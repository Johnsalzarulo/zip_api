class ZipService
  include ImportHelper

  def initialize(zip)
    @zip = zip
  end

  def perform
    csv = get_csv("public/zip_to_cbsa.csv")
    row = csv.select { |row| row['ï»¿ZIP'] == @zip }
    return row_not_found if row.blank?
    hash = row.map(&:to_h)[0]
    cbsa_values = CbsaService.new(hash["CBSA"]).perform
    hash.store(:msa, cbsa_values[:MSANAME])
    hash.store(:Pop2015, cbsa_values[:POPESTIMATE2015])
    hash.store(:Pop2014, cbsa_values[:POPESTIMATE2014])
    format_response(hash)
  end

  private

  def row_not_found
    {
     "ZIP": "N/A",
     "MSA": "N/A",
     "CBSA": "N/A"
   }
  end

  def format_response(hash)
    {
      "ZIP": hash["ï»¿ZIP"],
      "CBSA": hash["CBSA"],
      "MSA": hash[:msa],
      "Pop2015": hash[:Pop2015],
      "Pop2014": hash[:Pop2014]
    }
  end
end
