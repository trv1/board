desc "Заполнение таблицы by_localities"
namespace :by_localities do
  task :create => :environment do
    # geoname_lvl_1_ids = Location.where(country: 'BY', code: 'region_lvl_1').pluck(:geoname_id)
    # by_lvl_1 = Alternatename.where(geonameid: geoname_lvl_1_ids, isolanguage: 'ru')
    #
    # by_lvl_1.each do |lvl_1|
    #   ByLocality.create(geoname_id: lvl_1.geonameid, name: lvl_1.alternatename)
    # end

    geoname_local_ids = Location.where(country: 'BY', code: 'locality').pluck(:geoname_id)
    by_local = Alternatename.where(geonameid: geoname_local_ids, isolanguage: 'ru')

    by_local.each do |local|
      next unless Location.where(geoname_id: local.geonameid).first.parent
      parent = ByLocality.where(geoname_id: Location.where(geoname_id: local.geonameid).first.parent.geoname_id).first
      next unless parent
      ByLocality.create(geoname_id: local.geonameid, name: local.alternatename, parent_id: parent.id)
    end
    # geonameids = Location.where(country: 'UA', parent_id: 3815).pluck(:geoname_id)
    # alternames = Alternatename.where(geonameid: geonameids, isolanguage: 'ru', ispreferredname: true)
    # alternames.each do |altername|
    #   RuLocality.create(geoname_id: altername.geonameid, name: altername.alternatename, parent_id: 9778)
    # end
  end
end
