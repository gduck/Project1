namespace :create_languages do
  desc "import the language database info"

  task :import_lang => :environment do
    require 'csv'    

    csv_text = File.read('lib/tasks/Languages.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      Language.create!(row.to_hash)
    end
  end
end