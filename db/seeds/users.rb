# frozen_string_literal: true

module Seeds
  class Users
    def self.seed
      puts 'Seeding users...'

      # Create users with predictable emails for idempotency
      users = []
      9.times do |i|
        user = User.find_or_create_by!(email: "user#{i + 1}@example.com") do |u|
          u.password = '123456'
          u.password_confirmation = '123456'
          u.confirmed_at = Time.current
        end
        users << user
      end

      puts 'Seeding Profiles...'
      users.each do |user|
        # Only create profile if it doesn't exist
        next if user.profile.present?

        user.create_profile!(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
          gender: Profile::GENDERS.sample
        )
      end
    end
  end
end
