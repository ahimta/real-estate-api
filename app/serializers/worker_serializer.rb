class WorkerSerializer < ActiveModel::Serializer
  attributes *Worker.props.attrs
end
