class Product < ActiveRecord::Base
	validates :description, :name, presence: true
	validates :price_in_cents, numericality: {only_integer: true}
	
	def change
		create_table :products do |t|
			t.string :name
			t.text :description
			t.integer :price_in_cents

			t.timestamps
		end
	end
end
