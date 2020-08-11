class Description < ApplicationRecord
  belongs_to :tag
  belongs_to :project
end
