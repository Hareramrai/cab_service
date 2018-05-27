module Response
  
  def json_response(collection, status = :ok)
    render json: collection, status: status
  end

  def json_format(collection)
    ActiveModel::Serializer::CollectionSerializer.new (collection)
  end

end
