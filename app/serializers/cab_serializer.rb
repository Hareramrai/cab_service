class CabSerializer < ActiveModel::Serializer
  attributes :id, :plat_number, :wi_fi, :type, :audio_system, :description
  belongs_to :cab_model
end
