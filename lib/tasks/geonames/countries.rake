desc "Заполнение таблицы countries"
namespace :countries do
  task :create => :environment do
    en_countries = Location.where(code: 'country')
    ru_countries = Alternatename.where('isolanguage ilike ? and geonameid IN (?)', 'ru', en_countries.pluck(:geoname_id))

    en_countries.each do |country|
      Country.create(geoname_id: country.geoname_id, name: country.name, code: country.country, isolanguage: 'en')
    end

    ru_countries.each do |country|
      Country.create(geoname_id: country.geonameid, name: country.alternatename, code: Location.where(geoname_id: country.geonameid).first.country, isolanguage: 'ru')
    end
  end
end
