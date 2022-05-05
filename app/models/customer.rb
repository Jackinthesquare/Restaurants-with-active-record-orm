class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews
    
    # Customer.third.full_name
    def full_name
        return self.first_name + " " + self.last_name
    end


    # Customer.second.favorite_restaurant
    def favorite_restaurant
        self.reviews.order("star_rating DESC").take(1)
    end


    # Customer.second.add_review(Restaurant.first, 1)
    def add_review(restaurant, rating)
        Review.create(restaurant: restaurant, star_rating: rating, customer: self)
    end

    
    # method drops review table
    def delete_reviews(restaurant)
        Review.destroy_all
    end
end