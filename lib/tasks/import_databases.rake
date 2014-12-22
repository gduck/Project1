namespace :import_databases do
  desc "import the  database info"

  task :import_lang => :environment do
    require 'csv'    

    csv_text = File.read('lib/tasks/Languages.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      Language.create!(row.to_hash)
    end
  end

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