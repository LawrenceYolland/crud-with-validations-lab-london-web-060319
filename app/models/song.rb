class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: %i[release_year artist_name]}
    validates :artist_name, presence: true

    validates :released, inclusion: { in: [true, false] }
        
    def released?
        released
    end

    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :released?
    
end