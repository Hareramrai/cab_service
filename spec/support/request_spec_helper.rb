module RequestSpecHelper

  # return valid headers
  def valid_headers
    {
      "Content-Type" => "application/json"
    }
  end

  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

end