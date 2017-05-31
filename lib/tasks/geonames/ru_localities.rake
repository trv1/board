desc "Заполнение таблицы ru_localities"
namespace :ru_localities do
  task :create => :environment do
    geoname_lvl_1_ids = Location.where(country: 'RU', code: 'region_lvl_1').pluck(:geoname_id)
    ru_lvl_1 = Alternatename.where(geonameid: geoname_lvl_1_ids, isolanguage: 'ru')

    ru_lvl_1.each do |lvl_1|
      # RuLocality.create(geoname_id: lvl_1.geonameid, name: lvl_1.alternatename)
    end

    geoname_local_ids = Location.where(country: 'RU', code: 'locality').pluck(:geoname_id)
    ru_local = Alternatename.where(geonameid: geoname_local_ids, isolanguage: 'ru')

    ru_local.each do |local|
      next unless Location.where(geoname_id: local.geonameid).first.parent
      parent = RuLocality.where(geoname_id: Location.where(geoname_id: local.geonameid).first.parent.geoname_id).first
      RuLocality.create(geoname_id: local.geonameid, name: local.alternatename, parent_id: parent.id)
    end
  end
end