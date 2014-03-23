class MaterialSerializer < ActiveModel::Serializer
  attributes *(Material::ATTRIBUTES)
end
