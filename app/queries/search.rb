class Search
  include ActiveModel::Model

  attr_accessor(
    :zip
  )

  def process
    clean_zip_code
    validate_zip
    return_results
  end

  def results
    @results
  end

  private

  def return_results
    return false if @errors.present?
    @results = ZipService.new(@zip).perform
  end

  def clean_zip_code
    @zip = @zip.delete("^0-9")
  end

  def validate_zip
    return invalid_zip unless @zip.length == 5
  end

  def invalid_zip
    errors.add("Zip Code", "Invalid - 5 digits only please")
    false
  end

end
