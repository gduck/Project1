namespace :create_profs do
  desc "import the proficiency database info"

  task :import_profs => :environment do
    require 'csv'    

    csv_text = File.read('lib/tasks/Languages_prof.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      LanguageProf.create!(row.to_hash)
    end
  end
end