class Article < ApplicationRecord
    include Visible
    # depedent is the helper that can help you to determine the relationship (when article is destroy, it will destroy the comments too)
    has_many :comments, dependent: :destroy

    # it will check the title and body is not nil (if they are nil, the program will raise an error)
    # the length will check the body is at least 10. (if it is less than 10, the program will raise an error)
    validates :title, presence: true 
    validates :body, presence: true, length: {minimum: 10}
end
