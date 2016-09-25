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

    def get_locations_hierarchy_query(country)
      q = "
            UPDATE locations l
            SET parent_id = NULL
            FROM (select l.id AS parent FROM locations l
            INNER JOIN geoname AS g ON l.geoname_id = g.geonameid
            WHERE g.country = '#{country}' AND l.is_edited = FALSE AND g.fcode IN ('PCLI', 'PCLF')) x
            WHERE l.id = x.parent;

            UPDATE locations l
            SET parent_id = x.parent
            FROM (select c.id AS parent, l.id AS child FROM locations l
            INNER JOIN geoname AS g1 ON l.country = g1.country AND g1.fcode IN ('PCLI', 'PCLF')
            INNER JOIN locations AS c ON c.geoname_id = g1.geonameid
            INNER JOIN geoname AS g2 ON l.geoname_id = g2.geonameid AND g2.fcode IN ('ADM1')
            WHERE g1.country = '#{country}' AND l.is_edited = FALSE AND l.code = 'region_lvl_1') x
            WHERE l.id = x.child;

            UPDATE locations l
            SET parent_id = x.parent
            FROM (select r.id AS parent,l.id AS child FROM locations l
            INNER JOIN geoname AS g2 ON l.geoname_id = g2.geonameid AND g2.fcode IN ('PPL', 'PPLA', 'PPLA2', 'PPLA3', 'PPLA4', 'PPLC', 'PPLF', 'PPLH', 'PPLL')
            INNER JOIN geoname AS g1 ON g2.country = g1.country AND g2.admin1 = g1.admin1 AND g1.fcode IN ('ADM1')
            INNER JOIN locations AS r ON r.geoname_id = g1.geonameid
            WHERE g1.country = '#{country}' AND l.is_edited = FALSE AND l.code = 'locality') x
            WHERE l.id = x.child;
          "
    end

    def get_all_populate_query(code, codes, geoname_table)
      q = "
            INSERT INTO locations (geoname_id, name, ascii_name, latitude, longitude, country, population, timezone, updated_at, is_edited, code, created_at)
            SELECT g.geonameid, g.name, g.asciiname, g.latitude, g.longitude, g.country, g.population, g.timezone, g.moddate, FALSE, '#{code}', '#{Time.now}'
            FROM #{geoname_table} AS g
            LEFT JOIN locations AS l ON l.geoname_id = g.geonameid
            WHERE l.geoname_id IS NULL AND g.fcode IN (#{codes});
            UPDATE locations l
            SET name = g.name, ascii_name = g.asciiname, latitude = g.latitude, longitude = g.longitude, country = g.country, population = g.population, updated_at = g.moddate, code = '#{code}'
            FROM #{geoname_table} g
            WHERE l.geoname_id = g.geonameid AND is_edited = FALSE AND fcode IN (#{codes});
        "
    end

    def get_all_hierarchy_query
      q = "
            UPDATE locations l
            SET parent_id = NULL
            FROM (select l.id AS parent FROM locations l
            INNER JOIN geoname AS g ON l.geoname_id = g.geonameid
            WHERE l.is_edited = FALSE AND g.fcode IN ('PCLI', 'PCLF')) x
            WHERE l.id = x.parent;

            UPDATE locations l
            SET parent_id = x.parent
            FROM (select c.id AS parent, l.id AS child FROM locations l
            INNER JOIN geoname AS g1 ON l.country = g1.country AND g1.fcode IN ('PCLI', 'PCLF')
            INNER JOIN locations AS c ON c.geoname_id = g1.geonameid
            INNER JOIN geoname AS g2 ON l.geoname_id = g2.geonameid AND g2.fcode IN ('ADM1')
            WHERE l.is_edited = FALSE AND l.code = 'region_lvl_1') x
            WHERE l.id = x.child;

            UPDATE locations l
            SET parent_id = x.parent
            FROM (select r.id AS parent,l.id AS child FROM locations l
            INNER JOIN geoname AS g2 ON l.geoname_id = g2.geonameid AND g2.fcode IN ('PPL', 'PPLA', 'PPLA2', 'PPLA3', 'PPLA4', 'PPLC', 'PPLF', 'PPLH', 'PPLL')
            INNER JOIN geoname AS g1 ON g2.country = g1.country AND g2.admin1 = g1.admin1 AND g1.fcode IN ('ADM1')
            INNER JOIN locations AS r ON r.geoname_id = g1.geonameid
            WHERE l.is_edited = FALSE AND l.code = 'locality') x
            WHERE l.id = x.child;
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
      # connection.execute(get_locations_populate_query(country, k, v, geoname_table))
      connection.execute(get_all_populate_query(k, v, geoname_table))
    }
    puts "Locations is populated"
    # language.each { |lang|
    #   q = get_locations_hierarchy_query(lang)
    #   connection.execute(q)
    # }

    # connection.execute(get_locations_hierarchy_query(country))
    connection.execute(get_all_hierarchy_query)
    puts "Locations hierarchy is ready"
  end
end
