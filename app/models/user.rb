class User < ApplicationRecord
  enum type_user: { disable: 0, normal_user: 5, admin_user: 9, enable: 16 }
end
