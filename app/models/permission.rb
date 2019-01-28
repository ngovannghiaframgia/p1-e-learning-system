class Permission < ApplicationRecord
  scope :by_role_id, -> (role_id){ where role_id: role_id }
end
