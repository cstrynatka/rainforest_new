class Product < ActiveRecord::Base
	has_many :reviews
	has_many :users, through: :reviews

	validates :description, :name, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	def change
		create_table :products do |t|
			t.string :name
			t.text :description
			t.integer :price_in_cents

			t.timestamps
		end

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end
	end
end

class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :products
end

class User < ActiveRecord::Base
	has_many :reviews
	has_many :products, through: :reviews
end
