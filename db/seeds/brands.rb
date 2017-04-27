def create_brands
  bicycle_brands = Brand.create([
                                    {name: 'Author', is_popular: true, is_velomobile: false},
                                    {name: 'Challenger', is_popular: true, is_velomobile: false},
                                    {name: 'Cube', is_popular: true, is_velomobile: false},
                                    {name: 'Format', is_popular: true, is_velomobile: false},
                                    {name: 'FORWARD', is_popular: true, is_velomobile: false},
                                    {name: 'Giant', is_popular: true, is_velomobile: false},
                                    {name: 'Merida', is_popular: true, is_velomobile: false},
                                    {name: 'Navigator', is_popular: true, is_velomobile: false},
                                    {name: 'Novatrak', is_popular: true, is_velomobile: false},
                                    {name: 'Scott', is_popular: true, is_velomobile: false},
                                    {name: 'STARK', is_popular: true, is_velomobile: false},
                                    {name: 'STELS', is_popular: true, is_velomobile: false},
                                    {name: 'Stinger', is_popular: true, is_velomobile: false},
                                    {name: 'TREK', is_popular: true, is_velomobile: false},
                                    {name: '1 TOY', is_popular: false, is_velomobile: false},
                                    {name: '3Bike', is_popular: false, is_velomobile: false},
                                    {name: 'Acsiom', is_popular: false, is_velomobile: false},
                                    {name: 'AGang', is_popular: false, is_velomobile: false},
                                    {name: 'AlfaBike', is_popular: false, is_velomobile: false},
                                    {name: 'Alpine', is_popular: false, is_velomobile: false},
                                    {name: 'ALTAIR', is_popular: false, is_velomobile: false},
                                    {name: 'Amigo', is_popular: false, is_velomobile: false},
                                    {name: 'Apollo', is_popular: false, is_velomobile: false},
                                    {name: 'Ardis', is_popular: false, is_velomobile: false},
                                    {name: 'ArmadA', is_popular: false, is_velomobile: false},
                                    {name: 'Aspect', is_popular: false, is_velomobile: false},
                                    {name: 'ATEMI', is_popular: false, is_velomobile: false},
                                    {name: 'ATOM', is_popular: false, is_velomobile: false},
                                    {name: 'Avanti', is_popular: false, is_velomobile: false},
                                    {name: 'Azimut', is_popular: false, is_velomobile: false},
                                    {name: 'B.O.N.E.', is_popular: false, is_velomobile: false},
                                    {name: 'Baltic', is_popular: false, is_velomobile: false},
                                    {name: 'Bergamont', is_popular: false, is_velomobile: false},
                                    {name: 'BH Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Bianchi', is_popular: false, is_velomobile: false},
                                    {name: 'Biceco', is_popular: false, is_velomobile: false},
                                    {name: 'Bickerton', is_popular: false, is_velomobile: false},
                                    {name: 'BIG', is_popular: false, is_velomobile: false},
                                    {name: 'Bigfish', is_popular: false, is_velomobile: false},
                                    {name: 'Bird', is_popular: false, is_velomobile: false},
                                    {name: 'Black One', is_popular: false, is_velomobile: false},
                                    {name: 'BlackAqua', is_popular: false, is_velomobile: false},
                                    {name: 'BMC', is_popular: false, is_velomobile: false},
                                    {name: 'BMW', is_popular: false, is_velomobile: false},
                                    {name: 'Boardman', is_popular: false, is_velomobile: false},
                                    {name: 'Bombtrack', is_popular: false, is_velomobile: false},
                                    {name: 'Brompton', is_popular: false, is_velomobile: false},
                                    {name: 'BTWIN', is_popular: false, is_velomobile: false},
                                    {name: 'Bulls', is_popular: false, is_velomobile: false},
                                    {name: 'Cannondale', is_popular: false, is_velomobile: false},
                                    {name: 'Capella', is_popular: false, is_velomobile: false},
                                    {name: 'Centurion', is_popular: false, is_velomobile: false},
                                    {name: 'Charge', is_popular: false, is_velomobile: false},
                                    {name: 'Cinelli', is_popular: false, is_velomobile: false},
                                    {name: 'Cipollini', is_popular: false, is_velomobile: false},
                                    {name: 'Code', is_popular: false, is_velomobile: false},
                                    {name: 'Colnago', is_popular: false, is_velomobile: false},
                                    {name: 'Colony', is_popular: false, is_velomobile: false},
                                    {name: 'Comanche', is_popular: false, is_velomobile: false},
                                    {name: 'Commencal', is_popular: false, is_velomobile: false},
                                    {name: 'Conway', is_popular: false, is_velomobile: false},
                                    {name: 'Corrado', is_popular: false, is_velomobile: false},
                                    {name: 'Corratec', is_popular: false, is_velomobile: false},
                                    {name: 'Corto', is_popular: false, is_velomobile: false},
                                    {name: 'Corvus', is_popular: false, is_velomobile: false},
                                    {name: 'Create', is_popular: false, is_velomobile: false},
                                    {name: 'Creme Cycles', is_popular: false, is_velomobile: false},
                                    {name: 'CRONUS', is_popular: false, is_velomobile: false},
                                    {name: 'CROSS', is_popular: false, is_velomobile: false},
                                    {name: 'Cyclone', is_popular: false, is_velomobile: false},
                                    {name: 'Dahon', is_popular: false, is_velomobile: false},
                                    {name: 'Decathlon', is_popular: false, is_velomobile: false},
                                    {name: 'Del Sol', is_popular: false, is_velomobile: false},
                                    {name: 'DENTON', is_popular: false, is_velomobile: false},
                                    {name: 'Dewolf', is_popular: false, is_velomobile: false},
                                    {name: 'Diamondback', is_popular: false, is_velomobile: false},
                                    {name: 'Discovery', is_popular: false, is_velomobile: false},
                                    {name: 'DK', is_popular: false, is_velomobile: false},
                                    {name: 'DMR Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Doppel', is_popular: false, is_velomobile: false},
                                    {name: 'Doppelganger', is_popular: false, is_velomobile: false},
                                    {name: 'Drag', is_popular: false, is_velomobile: false},
                                    {name: 'Eastern', is_popular: false, is_velomobile: false},
                                    {name: 'Ecobahn', is_popular: false, is_velomobile: false},
                                    {name: 'Ecobike', is_popular: false, is_velomobile: false},
                                    {name: 'Ecoffect', is_popular: false, is_velomobile: false},
                                    {name: 'ElBike', is_popular: false, is_velomobile: false},
                                    {name: 'Electra', is_popular: false, is_velomobile: false},
                                    {name: 'Element', is_popular: false, is_velomobile: false},
                                    {name: 'Eltreco', is_popular: false, is_velomobile: false},
                                    {name: 'Eurobike', is_popular: false, is_velomobile: false},
                                    {name: 'Fairdale Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Felt', is_popular: false, is_velomobile: false},
                                    {name: 'Fiction BMX', is_popular: false, is_velomobile: false},
                                    {name: 'Fitbikeco', is_popular: false, is_velomobile: false},
                                    {name: 'Fly', is_popular: false, is_velomobile: false},
                                    {name: 'Flygear', is_popular: false, is_velomobile: false},
                                    {name: 'Focus', is_popular: false, is_velomobile: false},
                                    {name: 'FoldX', is_popular: false, is_velomobile: false},
                                    {name: 'Ford', is_popular: false, is_velomobile: false},
                                    {name: 'Formula', is_popular: false, is_velomobile: false},
                                    {name: 'FORT', is_popular: false, is_velomobile: false},
                                    {name: 'Forte', is_popular: false, is_velomobile: false},
                                    {name: 'Free Agent', is_popular: false, is_velomobile: false},
                                    {name: 'Fuji Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Fury', is_popular: false, is_velomobile: false},
                                    {name: 'Gary Fisher', is_popular: false, is_velomobile: false},
                                    {name: 'Geoby', is_popular: false, is_velomobile: false},
                                    {name: 'Ghost', is_popular: false, is_velomobile: false},
                                    {name: 'Globe', is_popular: false, is_velomobile: false},
                                    {name: 'Grace', is_popular: false, is_velomobile: false},
                                    {name: 'Grand Toys', is_popular: false, is_velomobile: false},
                                    {name: 'Gravity', is_popular: false, is_velomobile: false},
                                    {name: 'GT', is_popular: false, is_velomobile: false},
                                    {name: 'Haibike', is_popular: false, is_velomobile: false},
                                    {name: 'Haro', is_popular: false, is_velomobile: false},
                                    {name: 'Hasa', is_popular: false, is_velomobile: false},
                                    {name: 'HEAD', is_popular: false, is_velomobile: false},
                                    {name: 'Hercules', is_popular: false, is_velomobile: false},
                                    {name: 'IDOL BIKES', is_popular: false, is_velomobile: false},
                                    {name: 'Incognito Bicycle', is_popular: false, is_velomobile: false},
                                    {name: 'Intense', is_popular: false, is_velomobile: false},
                                    {name: 'Intenzo', is_popular: false, is_velomobile: false},
                                    {name: 'Iron Horse', is_popular: false, is_velomobile: false},
                                    {name: 'Islabikes', is_popular: false, is_velomobile: false},
                                    {name: 'JAGUAR', is_popular: false, is_velomobile: false},
                                    {name: 'JAMIS', is_popular: false, is_velomobile: false},
                                    {name: 'Jango', is_popular: false, is_velomobile: false},
                                    {name: 'Jorex', is_popular: false, is_velomobile: false},
                                    {name: 'Joy Automatic', is_popular: false, is_velomobile: false},
                                    {name: 'K1', is_popular: false, is_velomobile: false},
                                    {name: 'Kalkhoff', is_popular: false, is_velomobile: false},
                                    {name: 'KELLYS', is_popular: false, is_velomobile: false},
                                    {name: 'KETTLER', is_popular: false, is_velomobile: false},
                                    {name: 'KHEbikes', is_popular: false, is_velomobile: false},
                                    {name: 'KHS', is_popular: false, is_velomobile: false},
                                    {name: 'KMS', is_popular: false, is_velomobile: false},
                                    {name: 'Kokkedal', is_popular: false, is_velomobile: false},
                                    {name: 'KONA', is_popular: false, is_velomobile: false},
                                    {name: 'Kross', is_popular: false, is_velomobile: false},
                                    {name: 'KTM', is_popular: false, is_velomobile: false},
                                    {name: 'Kuwahara', is_popular: false, is_velomobile: false},
                                    {name: 'KWIT', is_popular: false, is_velomobile: false},
                                    {name: 'Land Rover', is_popular: false, is_velomobile: false},
                                    {name: 'Langtu', is_popular: false, is_velomobile: false},
                                    {name: 'Lapierre', is_popular: false, is_velomobile: false},
                                    {name: 'Larsen', is_popular: false, is_velomobile: false},
                                    {name: 'Le Grand', is_popular: false, is_velomobile: false},
                                    {name: 'Leader', is_popular: false, is_velomobile: false},
                                    {name: 'Lee Cougan', is_popular: false, is_velomobile: false},
                                    {name: 'Legend', is_popular: false, is_velomobile: false},
                                    {name: 'LEON', is_popular: false, is_velomobile: false},
                                    {name: 'Lexus', is_popular: false, is_velomobile: false},
                                    {name: 'Lider', is_popular: false, is_velomobile: false},
                                    {name: 'Lider Kids', is_popular: false, is_velomobile: false},
                                    {name: 'LIKEtoBIKE', is_popular: false, is_velomobile: false},
                                    {name: 'Linus', is_popular: false, is_velomobile: false},
                                    {name: 'Longwise', is_popular: false, is_velomobile: false},
                                    {name: 'Look', is_popular: false, is_velomobile: false},
                                    {name: 'Lorak', is_popular: false, is_velomobile: false},
                                    {name: 'LTD', is_popular: false, is_velomobile: false},
                                    {name: 'Mafiabikes', is_popular: false, is_velomobile: false},
                                    {name: 'Magellan', is_popular: false, is_velomobile: false},
                                    {name: 'Marin', is_popular: false, is_velomobile: false},
                                    {name: 'Mars', is_popular: false, is_velomobile: false},
                                    {name: 'Maverick', is_popular: false, is_velomobile: false},
                                    {name: 'MaxxPro', is_popular: false, is_velomobile: false},
                                    {name: 'Mayer', is_popular: false, is_velomobile: false},
                                    {name: 'MBK', is_popular: false, is_velomobile: false},
                                    {name: 'MEJIAS', is_popular: false, is_velomobile: false},
                                    {name: 'Mercedes-Benz', is_popular: false, is_velomobile: false},
                                    {name: 'Micargi Bicycles', is_popular: false, is_velomobile: false},
                                    {name: 'Milly Mally', is_popular: false, is_velomobile: false},
                                    {name: 'Minerva', is_popular: false, is_velomobile: false},
                                    {name: 'MINI', is_popular: false, is_velomobile: false},
                                    {name: 'Miracolo', is_popular: false, is_velomobile: false},
                                    {name: 'Mirraco', is_popular: false, is_velomobile: false},
                                    {name: 'Mobiky', is_popular: false, is_velomobile: false},
                                    {name: 'Mondraker', is_popular: false, is_velomobile: false},
                                    {name: 'Mongoose', is_popular: false, is_velomobile: false},
                                    {name: 'Montague', is_popular: false, is_velomobile: false},
                                    {name: 'Montego', is_popular: false, is_velomobile: false},
                                    {name: 'Motor', is_popular: false, is_velomobile: false},
                                    {name: 'MTR', is_popular: false, is_velomobile: false},
                                    {name: 'MUSTANG', is_popular: false, is_velomobile: false},
                                    {name: 'Myatu', is_popular: false, is_velomobile: false},
                                    {name: 'Nakxus', is_popular: false, is_velomobile: false},
                                    {name: 'Nemobike', is_popular: false, is_velomobile: false},
                                    {name: 'Nirve', is_popular: false, is_velomobile: false},
                                    {name: 'Nishiki', is_popular: false, is_velomobile: false},
                                    {name: 'Norco', is_popular: false, is_velomobile: false},
                                    {name: 'NORDWAY', is_popular: false, is_velomobile: false},
                                    {name: 'NORMAN', is_popular: false, is_velomobile: false},
                                    {name: 'Novus', is_popular: false, is_velomobile: false},
                                    {name: 'NS Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Omaks', is_popular: false, is_velomobile: false},
                                    {name: 'Optima', is_popular: false, is_velomobile: false},
                                    {name: 'ORBEA', is_popular: false, is_velomobile: false},
                                    {name: 'Orion', is_popular: false, is_velomobile: false},
                                    {name: 'Oyama', is_popular: false, is_velomobile: false},
                                    {name: 'PANTHER', is_popular: false, is_velomobile: false},
                                    {name: 'Pashley', is_popular: false, is_velomobile: false},
                                    {name: 'Pegasus', is_popular: false, is_velomobile: false},
                                    {name: 'Perv', is_popular: false, is_velomobile: false},
                                    {name: 'Peugeot', is_popular: false, is_velomobile: false},
                                    {name: 'PG-Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Pilot', is_popular: false, is_velomobile: false},
                                    {name: 'Pinarello', is_popular: false, is_velomobile: false},
                                    {name: 'Pioneer', is_popular: false, is_velomobile: false},
                                    {name: 'Polygon', is_popular: false, is_velomobile: false},
                                    {name: 'Porsche', is_popular: false, is_velomobile: false},
                                    {name: 'Premier', is_popular: false, is_velomobile: false},
                                    {name: 'Premium', is_popular: false, is_velomobile: false},
                                    {name: 'Prestige', is_popular: false, is_velomobile: false},
                                    {name: 'Pride', is_popular: false, is_velomobile: false},
                                    {name: 'Profi Trike', is_popular: false, is_velomobile: false},
                                    {name: 'Puky', is_popular: false, is_velomobile: false},
                                    {name: 'Pure City', is_popular: false, is_velomobile: false},
                                    {name: 'Pure Fix', is_popular: false, is_velomobile: false},
                                    {name: 'Racer', is_popular: false, is_velomobile: false},
                                    {name: 'Radio', is_popular: false, is_velomobile: false},
                                    {name: 'Radio Flyer', is_popular: false, is_velomobile: false},
                                    {name: 'Raleigh', is_popular: false, is_velomobile: false},
                                    {name: 'Rapid Sport', is_popular: false, is_velomobile: false},
                                    {name: 'Rastar', is_popular: false, is_velomobile: false},
                                    {name: 'RBIKE', is_popular: false, is_velomobile: false},
                                    {name: 'Redline', is_popular: false, is_velomobile: false},
                                    {name: 'REGGY', is_popular: false, is_velomobile: false},
                                    {name: 'Rennrad', is_popular: false, is_velomobile: false},
                                    {name: 'Ride', is_popular: false, is_velomobile: false},
                                    {name: 'RiverBike', is_popular: false, is_velomobile: false},
                                    {name: 'Rizer', is_popular: false, is_velomobile: false},
                                    {name: 'ROCK MACHINE', is_popular: false, is_velomobile: false},
                                    {name: 'Rocky Mountain', is_popular: false, is_velomobile: false},
                                    {name: 'Romet', is_popular: false, is_velomobile: false},
                                    {name: 'Rossignol', is_popular: false, is_velomobile: false},
                                    {name: 'Rover', is_popular: false, is_velomobile: false},
                                    {name: 'Royal Baby', is_popular: false, is_velomobile: false},
                                    {name: 'Ruhrwerk', is_popular: false, is_velomobile: false},
                                    {name: 'Russbike', is_popular: false, is_velomobile: false},
                                    {name: "S'cool", is_popular: false, is_velomobile: false},
                                    {name: 'Santa Cruz', is_popular: false, is_velomobile: false},
                                    {name: 'Schwinn', is_popular: false, is_velomobile: false},
                                    {name: 'SE Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Shulz', is_popular: false, is_velomobile: false},
                                    {name: 'Silverback', is_popular: false, is_velomobile: false},
                                    {name: 'Skoda', is_popular: false, is_velomobile: false},
                                    {name: 'SkyLand', is_popular: false, is_velomobile: false},
                                    {name: 'Smart Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Smith', is_popular: false, is_velomobile: false},
                                    {name: 'Sochi 2014', is_popular: false, is_velomobile: false},
                                    {name: 'Sold Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Specialized', is_popular: false, is_velomobile: false},
                                    {name: 'Spelli', is_popular: false, is_velomobile: false},
                                    {name: 'SPRINT', is_popular: false, is_velomobile: false},
                                    {name: 'Stadier', is_popular: false, is_velomobile: false},
                                    {name: 'Stereo Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'Stern', is_popular: false, is_velomobile: false},
                                    {name: 'Stevens', is_popular: false, is_velomobile: false},
                                    {name: 'STOLEN', is_popular: false, is_velomobile: false},
                                    {name: 'Strida', is_popular: false, is_velomobile: false},
                                    {name: 'Striker', is_popular: false, is_velomobile: false},
                                    {name: 'Subrosa', is_popular: false, is_velomobile: false},
                                    {name: 'Sunday Bikes', is_popular: false, is_velomobile: false},
                                    {name: 'SUNRISe', is_popular: false, is_velomobile: false},
                                    {name: 'Superior', is_popular: false, is_velomobile: false},
                                    {name: 'Sura', is_popular: false, is_velomobile: false},
                                    {name: 'TaiLG', is_popular: false, is_velomobile: false},
                                    {name: 'Tank', is_popular: false, is_velomobile: false},
                                    {name: 'Taurus', is_popular: false, is_velomobile: false},
                                    {name: 'Techteam', is_popular: false, is_velomobile: false},
                                    {name: 'Tern', is_popular: false, is_velomobile: false},
                                    {name: 'Top Gear', is_popular: false, is_velomobile: false},
                                    {name: 'Tornado', is_popular: false, is_velomobile: false},
                                    {name: 'Torrent', is_popular: false, is_velomobile: false},
                                    {name: 'TotalBMX', is_popular: false, is_velomobile: false},
                                    {name: 'Totem', is_popular: false, is_velomobile: false},
                                    {name: 'triumph', is_popular: false, is_velomobile: false},
                                    {name: 'TRIX', is_popular: false, is_velomobile: false},
                                    {name: 'Tunturi', is_popular: false, is_velomobile: false},
                                    {name: 'UMF', is_popular: false, is_velomobile: false},
                                    {name: 'United', is_popular: false, is_velomobile: false},
                                    {name: 'UNIVEGA', is_popular: false, is_velomobile: false},
                                    {name: 'Unix', is_popular: false, is_velomobile: false},
                                    {name: 'Upland', is_popular: false, is_velomobile: false},
                                    {name: 'URAN', is_popular: false, is_velomobile: false},
                                    {name: 'Velox', is_popular: false, is_velomobile: false},
                                    {name: 'Verde', is_popular: false, is_velomobile: false},
                                    {name: 'Victoria', is_popular: false, is_velomobile: false},
                                    {name: 'Vintage Electric', is_popular: false, is_velomobile: false},
                                    {name: 'VIVA', is_popular: false, is_velomobile: false},
                                    {name: 'Volare', is_popular: false, is_velomobile: false},
                                    {name: 'Volkswagen', is_popular: false, is_velomobile: false},
                                    {name: 'Volteco', is_popular: false, is_velomobile: false},
                                    {name: 'Wayel', is_popular: false, is_velomobile: false},
                                    {name: 'WELLNESS', is_popular: false, is_velomobile: false},
                                    {name: 'Welt', is_popular: false, is_velomobile: false},
                                    {name: 'WeThePeople', is_popular: false, is_velomobile: false},
                                    {name: 'WHEELER', is_popular: false, is_velomobile: false},
                                    {name: 'Wilier', is_popular: false, is_velomobile: false},
                                    {name: 'Wind', is_popular: false, is_velomobile: false},
                                    {name: 'Winner', is_popular: false, is_velomobile: false},
                                    {name: 'Winora', is_popular: false, is_velomobile: false},
                                    {name: 'Xiaomi', is_popular: false, is_velomobile: false},
                                    {name: 'Yedoo', is_popular: false, is_velomobile: false},
                                    {name: 'Zippy', is_popular: false, is_velomobile: false},
                                    {name: 'Аист', is_popular: false, is_velomobile: false},
                                    {name: 'Атмос', is_popular: false, is_velomobile: false},
                                    {name: 'Дорожник', is_popular: false, is_velomobile: false},
                                    {name: 'СИБВЕЛЗ', is_popular: false, is_velomobile: false},
                                    {name: 'ХВЗ', is_popular: false, is_velomobile: false},
                                ])

  velomobile_brands = Brand.create([
                                       {name: 'Akkurad', is_popular: true, is_velomobile: true},
                                       {name: 'Allight', is_popular: true, is_velomobile: true},
                                       {name: 'Arcus Velomobile', is_popular: true, is_velomobile: true},
                                       {name: 'Beyss', is_popular: true, is_velomobile: true},
                                       {name: 'Bike Revolution', is_popular: true, is_velomobile: true},
                                       {name: 'Birkenstock Bicycles', is_popular: true, is_velomobile: true},
                                       {name: 'Blue Sky Design', is_popular: true, is_velomobile: true},
                                       {name: 'Bluevelo', is_popular: true, is_velomobile: true},
                                       {name: 'Columbia Cycle Works', is_popular: true, is_velomobile: true},
                                       {name: 'CyclesJV-Fenioux', is_popular: true, is_velomobile: true},
                                       {name: 'Cykelmartin', is_popular: true, is_velomobile: true},
                                       {name: 'Dream Cycle', is_popular: true, is_velomobile: true},
                                       {name: 'Drymer', is_popular: true, is_velomobile: true},
                                       {name: 'Elmar Maier', is_popular: true, is_velomobile: true},
                                       {name: 'Fam-Rad', is_popular: true, is_velomobile: true},
                                       {name: 'Flevo Bike', is_popular: true, is_velomobile: true},
                                       {name: 'Floow Kantoor', is_popular: true, is_velomobile: true},
                                       {name: 'Hase Bikes', is_popular: true, is_velomobile: true},
                                       {name: 'Inter City Bike', is_popular: true, is_velomobile: true},
                                       {name: 'Jouta', is_popular: true, is_velomobile: true},
                                       {name: 'Katanga', is_popular: true, is_velomobile: true},
                                       {name: 'Leiba', is_popular: true, is_velomobile: true},
                                       {name: 'Leitra', is_popular: true, is_velomobile: true},
                                       {name: 'Marvelo', is_popular: true, is_velomobile: true},
                                       {name: 'Nu Way 2 Commute', is_popular: true, is_velomobile: true},
                                       {name: 'Organic Transit', is_popular: true, is_velomobile: true},
                                       {name: 'Pannon Solar', is_popular: true, is_velomobile: true},
                                       {name: 'Pterovelo', is_popular: true, is_velomobile: true},
                                       {name: 'Rainforest Designs Ltd', is_popular: true, is_velomobile: true},
                                       {name: 'Räderwerk GmbH', is_popular: true, is_velomobile: true},
                                       {name: 'Reg Rodaro Velomobiles', is_popular: true, is_velomobile: true},
                                       {name: 'RJK', is_popular: true, is_velomobile: true},
                                       {name: 'Silver Bullet', is_popular: true, is_velomobile: true},
                                       {name: 'Sinner', is_popular: true, is_velomobile: true},
                                       {name: 'Stilic Force', is_popular: true, is_velomobile: true},
                                       {name: 'Trisled', is_popular: true, is_velomobile: true},
                                       {name: 'Twike', is_popular: true, is_velomobile: true},
                                       {name: 'Velayo - Progress Vehicle', is_popular: true, is_velomobile: true},
                                       {name: 'Velocity Velos', is_popular: true, is_velomobile: true},
                                       {name: 'Veloform', is_popular: true, is_velomobile: true},
                                       {name: 'Velomobiel', is_popular: true, is_velomobile: true},
                                       {name: 'VelomobileUSA', is_popular: true, is_velomobile: true},
                                       {name: 'Veloschmitt', is_popular: true, is_velomobile: true},
                                       {name: 'Velovergne', is_popular: true, is_velomobile: true},
                                       {name: 'Veltop', is_popular: true, is_velomobile: true},
                                       {name: 'Vrijwiel', is_popular: true, is_velomobile: true},
                                   ])
end

create_brands