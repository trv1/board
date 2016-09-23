desc "Заполнение таблицы locations"
namespace :locations do
  task :create => :environment do
    ActiveRecord::Base.connection.exec_query()
    q = "
            INSERT INTO location (geoname_id, name, ascii_name, latitude, longitude, country, population, timezone, updated_at, is_edited, code)
            SELECT g.geonameid, g.name, g.asciiname, g.latitude, g.longitude, g.country, g.population, g.timezone, g.moddate, FALSE, #{}
            FROM geonames_geoname AS g
            LEFT JOIN location AS l ON l.geoname_id = g.geonameid
            WHERE g.country = :country AND l.geoname_id IS NULL AND g.fcode IN (:codes);
            UPDATE location AS l
            INNER JOIN geonames_geoname AS g ON l.geoname_id = g.geonameid
            SET l.name = g.name, l.ascii_name = g.ascii_name, l.latitude = g.latitude, l.longitude = g.longitude, l.country = g.country, l.population = g.population, l.updated_at = g.updated_at, l.code = :code
            WHERE g.country = :country AND is_edited = FALSE AND fcode IN (:codes);
        "
    codeMap = [
        'country'      => "'PCLI', 'PCLF'",
        'region_lvl_1' => "'ADM1'",
        'locality'     => "'PPL', 'PPLA', 'PPLA2', 'PPLA3', 'PPLA4', 'PPLC', 'PPLF', 'PPLH', 'PPLL'",
    ]
    codeMap.each {
      |code, codes|
      geonameTable = code == 'locality' ? 'geonames_cities' : 'geonames_geoname'
    }
    foreach ($codeMap as $code => $codes) {
        $geonameTable = $code == 'locality' ? 'geonames_cities' : 'geonames_geoname';
        $sql = strtr($q, [
            ':country' => $conn->quote($this->country),
            ':codes' => $codes,
            ':code' => $code,
            'geonames_geoname' => $geonameTable,
        ]);
        $conn->exec($sql);
    }
    $output->writeln('Добавляю переводы в location');
    $sql = strtr(
        "
                UPDATE location AS l
                  INNER JOIN geonames_alternatename AS a ON l.geoname_id = a.geonameid AND a.isoLanguage = :language
                SET l.name = a.alternateName;
                UPDATE location AS l
                  INNER JOIN geonames_alternatename AS a ON l.geoname_id = a.geonameid AND a.isoLanguage = :language
                SET l.name = a.alternateName
                WHERE a.isPreferredName = 1;
            ",
        [
            ':language' => $conn->quote($this->language),
        ]
    );
    $conn->exec($sql);
  end
end
