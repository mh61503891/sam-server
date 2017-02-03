namespace :sunaba do
  namespace :db do
    namespace :fixtures do
      desc "Loads fixtures into the current environment's database"
      task :load => :environment do
        fixtures = %w(
          people
          titles
          yp/garoon/people
          yp/garoon/groups
          yp/garoon/memberships
          computers
          applications
          licenses
          computer_assignments
          application_assignments
          license_assignments
          person_computers
          person_applications
          person_licenses
        )
        ENV['FIXTURES'] = fixtures.join(',')
        Rake::Task['db:fixtures:load'].invoke
      end
    end
  end
end
