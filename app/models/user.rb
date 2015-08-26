class User < ActiveRecord::Base
  has_one :inbox
end
