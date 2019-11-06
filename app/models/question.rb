class Question < ApplicationRecord
  has_many :comments , dependent: :delete_all
  validates :question, presence: true,
                    length: { minimum: 5 }
end
