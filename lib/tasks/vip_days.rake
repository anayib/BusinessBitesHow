desc "Heroku management VIP days"
task :vip_days => :environment do
  puts "Analizando estado de usuarios invitados"
  User.vip_days?
  puts "Analisis de usuarios invitados finalizado"
end