class Contract
  include Mongoid::Document
  field :amount, type: Integer
  field :start_date, type: Date
  field :end_date, type: Date
  field :owner, type: User
end
