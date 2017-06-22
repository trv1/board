desc "Заполнение таблицы ge_localities"
namespace :ge_localities do
  task :create => :environment do
    # geoname_lvl_1_ids = Location.where(country: 'GE', code: 'region_lvl_1').pluck(:geoname_id)
    # kz_lvl_1 = Alternatename.where(geonameid: geoname_lvl_1_ids, isolanguage: 'ru')
    #
    # kz_lvl_1.each do |lvl_1|
    #   GeLocality.create(geoname_id: lvl_1.geonameid, name: lvl_1.alternatename)
    # end

    # geoname_local_ids = Location.where(country: 'GE', code: 'locality').pluck(:geoname_id)
    # ge_local = Alternatename.where(geonameid: geoname_local_ids, isolanguage: 'ru')
    #
    # ge_local.each do |local|
    #   next unless Location.where(geoname_id: local.geonameid).first.parent
    #   parent = GeLocality.where(geoname_id: Location.where(geoname_id: local.geonameid).first.parent.geoname_id).first
    #   next unless parent
    #   GeLocality.create(geoname_id: local.geonameid, name: local.alternatename, parent_id: parent.id)
    # end

    ge_locations = Location.where(country: 'GE', code: 'locality')
    ge_locations.each do |location|
      next if GeLocality.where(geoname_id: location.geoname_id).size > 0
      location_parent = Location.where(geoname_id: location.geoname_id).first.parent
      parent = GeLocality.where(geoname_id: location_parent.geoname_id).first if location_parent
      GeLocality.create(geoname_id: location.geoname_id, name: location.name, parent_id: (parent ? parent.id : nil))
    end
    # geonameids = Location.where(country: 'UA', parent_id: 3815).pluck(:geoname_id)
    # alternames = Alternatename.where(geonameid: geonameids, isolanguage: 'ru', ispreferredname: true)
    # alternames.each do |altername|
    #   RuLocality.create(geoname_id: altername.geonameid, name: altername.alternatename, parent_id: 9778)
    # end
  end
end
