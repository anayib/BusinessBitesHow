desc "Heroku management new course days"
task :new_course_days => :environment do
  puts "Analizando estado de cursos nuevos"
  Course.has_new_course_days?
  puts "Analisis de cursos nuevos finalizado"
end