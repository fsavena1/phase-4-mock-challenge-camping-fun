class SignupActivitySerializer < ActiveModel::Serializer
  attributes :id, :time
 has_one :activity
end
