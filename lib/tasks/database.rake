namespace :db do 
  desc "create, migrated and populate with test data the database"
  task :reload do
    p "-------------------  DROPPING DB  -------------------"
    Rake::Task["db:drop"].invoke

    p "-------------------  CREATING DB  -------------------"
    Rake::Task["db:create"].invoke

    p "-------------------  MIGRATING DB  -------------------"
    Rake::Task["db:migrate"].invoke

    p "-------------------  SEEDING DB   -------------------"
    Rake::Task["db:seed"].invoke
  end
end
