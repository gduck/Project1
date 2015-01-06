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

  task :import_profnames => :environment do
    require 'csv'   

    csv_text = File.read('lib/tasks/Prof_names.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      ProfCategory.create!(row.to_hash)
    end
  end

  task :import_all => :environment do
    require 'csv'
    task :import_profnames
    task :import_profs
    task :import_lang
  end
end