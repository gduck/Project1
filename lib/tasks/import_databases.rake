namespace :import_databases do
  desc "import the  database info"

  task :do_all => :environment do
    import_langs
    import_profs
    import_profnames
    import_companies
    import_agent_assocs
    import_positions
    import_lang_reqs
  end

  def import_langs
    require 'csv'

    csv_text = File.read('lib/tasks/Languages.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      Language.create!(row.to_hash)
    end
  end

  def import_profs
    require 'csv'    

    csv_text = File.read('lib/tasks/Languages_prof.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      LanguageProf.create!(row.to_hash)
    end
  end

  def import_profnames
    require 'csv'   

    csv_text = File.read('lib/tasks/Prof_names.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      ProfCategory.create!(row.to_hash)
    end
  end

  def import_companies
    require 'csv'   

    csv_text = File.read('lib/tasks/companies.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      Company.create!(row.to_hash)
    end
  end

  def import_agent_assocs
   require 'csv'   

    csv_text = File.read('lib/tasks/agent_associations.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      AgentAssociation.create!(row.to_hash)
    end  
  end

  task :import_positions => :environment do
   require 'csv'   

    csv_text = File.read('lib/tasks/positions.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      Position.create!(row.to_hash)
    end  
  end

  def import_lang_reqs
   require 'csv'   

    csv_text = File.read('lib/tasks/lang_prof_requirements.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      puts ">>>>>>>> #{row.to_hash}"
      LangProfReq.create!(row.to_hash)
    end  
  end

end