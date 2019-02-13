class HomeworkResult < ApplicationRecord
  belongs_to :user
  belongs_to :homework
end
