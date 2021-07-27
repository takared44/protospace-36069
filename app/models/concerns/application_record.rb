class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true #このコードはいらない？
end
