class WorkerSerializer < ActiveModel::Serializer
  attributes *(Worker::ATTRIBUTES)
end
