desc "Заполнение таблицы locations"
namespace :locations do
  task :create => :environment do
    def get_locations_populate_query(country, code, codes, geoname_table)
      q = "
            INSERT INTO locations (geoname_id, name, ascii_name, latitude, longitude, country, population, timezone, updated_at, is_edited, code, created_at)
            SELECT g.geonameid, g.name, g.asciiname, g.latitude, g.longitude, g.country, g.population, g.timezone, g.moddate, FALSE, '#{code}', '#{Time.now}'
            FROM #{geoname_table} AS g
            LEFT JOIN locations AS l ON l.geoname_id = g.geonameid
            WHERE g.country = '#{country}' AND l.geoname_id IS NULL AND g.fcode IN (#{codes});
            UPDATE locations l
            SET name = g.name, ascii_name = g.asciiname, latitude = g.latitude, longitude = g.longitude, country = g.country, population = g.population, updated_at = g.moddate, code = '#{code}'
            FROM #{geoname_table} g
            WHERE l.geoname_id = g.geonameid AND g.country = '#{country}' AND is_edited = FALSE AND fcode IN (#{codes});
        "
    end

    # Query for alternate names of locations
    def get_locations_names_query(language)
      q = "
            UPDATE locations AS l
              INNER JOIN alternatename AS a ON l.geoname_id = a.geonameid AND a.isoLanguage = #{language}
            SET l.name = a.alternateName;
            UPDATE locations AS l
              INNER JOIN alternatename AS a ON l.geoname_id = a.geonameid AND a.isoLanguage = #{language}
            SET l.name = a.alternateName
            WHERE a.isPreferredName = 1;
          "
    end

    def get_locations_hierarchy_query(country)
      q = "
            UPDATE locations l
            SET parent = NULL
            FROM geoname g
            WHERE l.geoname_id = g.geonameid AND g.country = '#{country}' AND l.is_edited = FALSE AND g.fcode IN ('PCLI', 'PCLF');
            UPDATE locations l
            SET parent = c.id
            FROM geoname g1
            INNER JOIN locations c ON c.geoname_id = g1.geonameid
            INNER JOIN geoname g2 ON geoname_id = g2.geonameid AND g2.fcode IN ('ADM1')
            WHERE l.country = g1.country AND g1.fcode IN ('PCLI', 'PCLF') AND g1.country = '#{country}' AND l.is_edited = FALSE AND l.code = 'region_lvl_1';
            UPDATE locations l
            SET parent = r.id
            FROM geoname g2
            INNER JOIN geoname g1 ON g2.country = g1.country AND g2.admin1 = g1.admin1 AND g1.fcode IN ('ADM1')
            INNER JOIN locations r ON r.geoname_id = g1.geonameid
            WHERE l.geoname_id = g2.geonameid AND g2.fcode IN ('PPL', 'PPLA', 'PPLA2', 'PPLA3', 'PPLA4', 'PPLC', 'PPLF', 'PPLH', 'PPLL') AND g1.country = '#{country}' AND l.is_edited = FALSE AND l.code = 'locality';
          "
    end

    country, connection = 'RU', ActiveRecord::Base.connection
    # language = %w(ru en)
    code_map = {
        'country'      => "'PCLI', 'PCLF'",
        'region_lvl_1' => "'ADM1'",
        'locality'     => "'PPL', 'PPLA', 'PPLA2', 'PPLA3', 'PPLA4', 'PPLC', 'PPLF', 'PPLH', 'PPLL'",
    }
    code_map.each { |k, v|
      geoname_table = k == 'locality' ? 'cities' : 'geoname'
      connection.execute(get_locations_populate_query(country, k, v, geoname_table))
    }
    puts "Locations is populated"
    # language.each { |lang|
    #   q = get_locations_hierarchy_query(lang)
    #   connection.execute(q)
    # }

    connection.execute(get_locations_hierarchy_query(country))
    puts "Locations hierarchy is ready"
  end
end
