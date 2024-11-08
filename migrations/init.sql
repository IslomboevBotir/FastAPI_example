CREATE TABLE hotels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT title_unique UNIQUE (title)
);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    paid BOOLEAN DEFAULT FALSE,
    hotel_id INTEGER REFERENCES hotels(id) ON DELETE CASCADE,
    client_id INTEGER REFERENCES clients(id) ON DELETE CASCADE
);

insert into hotels (title, description) values ('Ryan Inc', 'Other specified injury of unspecified tibial artery, unspecified leg, sequela');
insert into hotels (title, description) values ('Lueilwitz-Nienow', 'Sepsis of newborn due to other streptococci');
insert into hotels (title, description) values ('Weissnat, Heller and Weimann', 'Cortical age-related cataract, bilateral');
insert into hotels (title, description) values ('Kilback-Williamson', 'Toxic effect of unspecified organic solvent, accidental (unintentional), subsequent encounter');
insert into hotels (title, description) values ('Stark, Bode and Hegmann', 'Unspecified dislocation of left ring finger, initial encounter');
insert into hotels (title, description) values ('Altenwerth-Russel', 'Jumping or diving into unspecified water causing drowning and submersion, sequela');
insert into hotels (title, description) values ('Hyatt-Daniel', 'Contusion of right thumb with damage to nail');
insert into hotels (title, description) values ('Kub-Littel', 'Follicular lymphoma, unspecified');
insert into hotels (title, description) values ('Mann-Bashirian', 'Nondisplaced osteochondral fracture of right patella, initial encounter for open fracture type I or II');
insert into hotels (title, description) values ('Hessel-Klein', 'Nondisplaced fracture of olecranon process without intraarticular extension of left ulna, initial encounter for open fracture type I or II');
insert into hotels (title, description) values ('Schmeler, Maggio and Larkin', 'Periprosthetic fracture around internal prosthetic left shoulder joint');
insert into hotels (title, description) values ('Larkin-Crist', 'Hemiplegia and hemiparesis following nontraumatic subarachnoid hemorrhage affecting unspecified side');
insert into hotels (title, description) values ('Parker, Becker and Kessler', 'Abscess of intestine');
insert into hotels (title, description) values ('Parker Inc', 'Laceration of lesser saphenous vein at lower leg level, left leg, initial encounter');
insert into hotels (title, description) values ('Hermann, Lakin and Jast', 'Unspecified juvenile rheumatoid arthritis, unspecified knee');
insert into hotels (title, description) values ('Reinger Inc', 'Other osteoporosis with current pathological fracture, unspecified humerus, subsequent encounter for fracture with routine healing');
insert into hotels (title, description) values ('Osinski, Bartoletti and Lockman', 'Unspecified fracture of upper end of right radius, initial encounter for closed fracture');
insert into hotels (title, description) values ('Lehner Inc', 'Unequal limb length (acquired), ulna and radius');
insert into hotels (title, description) values ('Stroman-King', 'Complete traumatic amputation of unspecified great toe, initial encounter');
insert into hotels (title, description) values ('Senger Inc', 'Burn of second degree of left foot');
insert into hotels (title, description) values ('O''Hara, Bartoletti and Murphy', 'Subluxation of unspecified acromioclavicular joint, sequela');
insert into hotels (title, description) values ('Cartwright-Goyette', 'Toxic effect of unspecified alcohol, undetermined, sequela');
insert into hotels (title, description) values ('Streich, Murphy and Lindgren', 'Osteonecrosis due to drugs, unspecified bone');
insert into hotels (title, description) values ('Ritchie-Grant', 'Car passenger injured in collision with railway train or railway vehicle in nontraffic accident, subsequent encounter');
insert into hotels (title, description) values ('Sipes, Jaskolski and Gerhold', 'Displacement of internal fixation device of left humerus');
insert into hotels (title, description) values ('Goodwin, Wintheiser and Marquardt', 'Car occupant (driver) (passenger) injured in transport accident with military vehicle, initial encounter');
insert into hotels (title, description) values ('Bayer Inc', 'Nondisplaced fracture of coronoid process of unspecified ulna, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with routine healing');
insert into hotels (title, description) values ('Romaguera, Kuphal and Ledner', 'Abrasion, unspecified lesser toe(s), sequela');
insert into hotels (title, description) values ('Jakubowski Group', 'Diphtheritic conjunctivitis');
insert into hotels (title, description) values ('Kertzmann-Hyatt', 'Displaced spiral fracture of shaft of left fibula, subsequent encounter for open fracture type I or II with nonunion');
insert into hotels (title, description) values ('Jast Inc', 'Lymphoid interstitial pneumonia');
insert into hotels (title, description) values ('Tromp, O''Reilly and Hettinger', 'Nondisplaced unspecified condyle fracture of lower end of unspecified femur, subsequent encounter for open fracture type I or II with malunion');
insert into hotels (title, description) values ('Schroeder Inc', 'Sprain of jaw, right side, initial encounter');
insert into hotels (title, description) values ('Corkery-Price', 'Recurrent dislocation, right finger');
insert into hotels (title, description) values ('Treutel Inc', 'Nondisplaced fracture of body of scapula, right shoulder, subsequent encounter for fracture with nonunion');
insert into hotels (title, description) values ('Hyatt, Spencer and Kunze', 'Fracture of radial styloid process');
insert into hotels (title, description) values ('Hoeger, Effertz and Weimann', 'Malignant neoplasm of right retina');
insert into hotels (title, description) values ('Schuppe and Sons', 'Personal history of mental and behavioral disorders');
insert into hotels (title, description) values ('Larson-Steuber', 'Nondisplaced fracture of capitate [os magnum] bone, unspecified wrist, sequela');
insert into hotels (title, description) values ('Senger-Doyle', 'Underdosing of insulin and oral hypoglycemic [antidiabetic] drugs');
insert into hotels (title, description) values ('Heidenreich and Sons', 'Unspecified sprain of left thumb, sequela');
insert into hotels (title, description) values ('Kuhlman, Stoltenberg and Cruickshank', 'Neonatal cerebral ischemia');
insert into hotels (title, description) values ('Herman, Lemke and Bradtke', 'Transient visual loss, right eye');
insert into hotels (title, description) values ('Boyer, Roberts and Kovacek', 'Poisoning by antimalarials and drugs acting on other blood protozoa, accidental (unintentional), sequela');
insert into hotels (title, description) values ('Treutel Group', 'Secondary corneal edema, left eye');
insert into hotels (title, description) values ('Botsford Group', 'Encounter for aftercare following liver transplant');
insert into hotels (title, description) values ('Ankunding and Sons', 'Unspecified injury of unspecified renal vein, initial encounter');
insert into hotels (title, description) values ('Medhurst-Stoltenberg', 'Injury of deep peroneal nerve at ankle and foot level, left leg, initial encounter');
insert into hotels (title, description) values ('Olson-Dooley', 'Corrosion of second degree of forehead and cheek');
insert into hotels (title, description) values ('Lang Inc', 'Postdysenteric arthropathy, right ankle and foot');
insert into hotels (title, description) values ('Heaney-Bosco', 'Person on outside of heavy transport vehicle injured in collision with heavy transport vehicle or bus in nontraffic accident, subsequent encounter');
insert into hotels (title, description) values ('Lind-Mraz', 'External constriction, right lower leg, sequela');
insert into hotels (title, description) values ('Bergnaum, Howell and Kling', 'Burn of first degree of right elbow, subsequent encounter');
insert into hotels (title, description) values ('Parisian-McDermott', 'Poisoning by skeletal muscle relaxants [neuromuscular blocking agents], undetermined, initial encounter');
insert into hotels (title, description) values ('Halvorson, Torphy and Russel', 'Poisoning by antigonadotrophins, antiestrogens, antiandrogens, not elsewhere classified, assault, initial encounter');
insert into hotels (title, description) values ('Wehner-Reichel', 'Kaposi''s sarcoma of right lung');
insert into hotels (title, description) values ('Lemke-Dooley', 'Fall from chair, initial encounter');
insert into hotels (title, description) values ('Kertzmann, Oberbrunner and O''Reilly', 'Periostitis of orbit');
insert into hotels (title, description) values ('Hayes, Hagenes and Shanahan', 'Poisoning by penicillins, assault, sequela');
insert into hotels (title, description) values ('Ullrich, Wiza and Rau', 'Other specified injury of ulnar artery at forearm level, right arm');
insert into hotels (title, description) values ('Kuhic, Stoltenberg and Gerlach', 'Other cardiovascular disorders originating in the perinatal period');
insert into hotels (title, description) values ('Torp-Osinski', 'Poisoning by other nonopioid analgesics and antipyretics, not elsewhere classified, accidental (unintentional), initial encounter');
insert into hotels (title, description) values ('Lueilwitz LLC', 'Other specified disorders of Eustachian tube, right ear');
insert into hotels (title, description) values ('Shields LLC', 'Displaced segmental fracture of shaft of left fibula, initial encounter for closed fracture');
insert into hotels (title, description) values ('Rippin, Hilpert and Lakin', 'Displaced fracture of proximal phalanx of left great toe, subsequent encounter for fracture with nonunion');
insert into hotels (title, description) values ('Greenholt LLC', 'Burn of first degree of right palm, initial encounter');
insert into hotels (title, description) values ('Beer LLC', 'Corrosion of second degree of chin, sequela');
insert into hotels (title, description) values ('Tillman LLC', 'Partial traumatic amputation of one unspecified lesser toe, subsequent encounter');
insert into hotels (title, description) values ('Marks, Haag and Kilback', 'Unspecified entropion of left lower eyelid');
insert into hotels (title, description) values ('Stiedemann LLC', 'Personal history of neoplasm of uncertain behavior');
insert into hotels (title, description) values ('Kautzer-Stoltenberg', 'Nondisplaced fracture of proximal phalanx of left thumb, subsequent encounter for fracture with delayed healing');
insert into hotels (title, description) values ('Kuhic-Zemlak', 'Family history of other diseases of the respiratory system');
insert into hotels (title, description) values ('McClure Inc', 'Dislocation of metatarsophalangeal joint of unspecified lesser toe(s), initial encounter');
insert into hotels (title, description) values ('Wolf Inc', 'Displaced segmental fracture of shaft of left tibia, initial encounter for open fracture type I or II');
insert into hotels (title, description) values ('Lind, Spencer and Blanda', 'Unspecified open wound, right foot');
insert into hotels (title, description) values ('Sawayn, Olson and Bogan', 'Nondisplaced fracture of right ulna styloid process');
insert into hotels (title, description) values ('Hayes, Barrows and Mayer', 'Displaced fracture of neck of fourth metacarpal bone, right hand, subsequent encounter for fracture with malunion');
insert into hotels (title, description) values ('Welch, Reilly and Wunsch', 'Malignant neoplasm of clitoris');
insert into hotels (title, description) values ('Skiles-Beatty', 'Malignant neoplasm of axillary tail of breast');
insert into hotels (title, description) values ('Trantow, Dicki and Kiehn', 'Displaced unspecified fracture of unspecified great toe, subsequent encounter for fracture with nonunion');
insert into hotels (title, description) values ('Heathcote-Kuvalis', 'Other specified intracranial injury without loss of consciousness');
insert into hotels (title, description) values ('Goyette-Greenholt', 'Other place in nursing home as the place of occurrence of the external cause');
insert into hotels (title, description) values ('Nitzsche-Block', 'Person on outside of pick-up truck or van injured in collision with pedestrian or animal in traffic accident, initial encounter');
insert into hotels (title, description) values ('Jaskolski, Hauck and Monahan', 'Displaced fracture of distal phalanx of other finger, subsequent encounter for fracture with routine healing');
insert into hotels (title, description) values ('Hills-Lind', 'Injury of left uterine artery, subsequent encounter');
insert into hotels (title, description) values ('Dietrich-Lindgren', 'Unspecified occupant of pick-up truck or van injured in collision with pedestrian or animal in traffic accident');
insert into hotels (title, description) values ('Morissette, Auer and Steuber', 'Unspecified sprain of unspecified hip');
insert into hotels (title, description) values ('Pfannerstill, Parisian and Weissnat', 'Toxic effect of unspecified gases, fumes and vapors, assault');
insert into hotels (title, description) values ('Hilll-Jast', 'Unspecified bus occupant injured in collision with unspecified motor vehicles in traffic accident, sequela');
insert into hotels (title, description) values ('Rohan-Kuvalis', 'Contusion of unspecified wrist, subsequent encounter');
insert into hotels (title, description) values ('Weissnat-Cummerata', 'Anterior cord syndrome at C8 level of cervical spinal cord, subsequent encounter');
insert into hotels (title, description) values ('Walker LLC', 'Adverse effect of other agents primarily affecting the cardiovascular system, sequela');
insert into hotels (title, description) values ('Wolf and Sons', 'Abrasion of breast, unspecified breast, initial encounter');
insert into hotels (title, description) values ('Murazik-Jakubowski', 'Exposure to industrial wiring, appliances and electrical machinery, initial encounter');
insert into hotels (title, description) values ('Bosco Inc', 'Benign neoplasm of scapula and long bones of right upper limb');
insert into hotels (title, description) values ('Kertzmann-Romaguera', 'Newborn affected by Cesarean delivery');
insert into hotels (title, description) values ('Hamill-Runolfsson', 'Aortitis in diseases classified elsewhere');
insert into hotels (title, description) values ('Keebler, Swaniawski and Hayes', 'Neuromuscular dysfunction of bladder, not elsewhere classified');
insert into hotels (title, description) values ('Morissette, Lowe and Crona', 'Type 2 fracture of sacrum, initial encounter for open fracture');
insert into hotels (title, description) values ('Wuckert, Champlin and Kilback', 'Puncture wound with foreign body of unspecified eyelid and periocular area, sequela');



insert into clients (name, phone, email) values ('Skyler Boake', '848-448-5127', 'sboake0@etsy.com');
insert into clients (name, phone, email) values ('Theodore Cagan', '805-846-2954', 'tcagan1@sohu.com');
insert into clients (name, phone, email) values ('Anstice Hobble', '939-994-0031', 'ahobble2@vimeo.com');
insert into clients (name, phone, email) values ('Antony Aldersey', '915-901-8467', 'aaldersey3@miitbeian.gov.cn');
insert into clients (name, phone, email) values ('Imogene Wenham', '961-960-0378', 'iwenham4@slideshare.net');
insert into clients (name, phone, email) values ('Rustin McGrady', '263-526-7871', 'rmcgrady5@latimes.com');
insert into clients (name, phone, email) values ('Kippie Verna', '677-951-6605', 'kverna6@artisteer.com');
insert into clients (name, phone, email) values ('Gigi Yitzowitz', '740-310-3094', 'gyitzowitz7@foxnews.com');
insert into clients (name, phone, email) values ('Dud Steffens', '304-150-9532', 'dsteffens8@nba.com');
insert into clients (name, phone, email) values ('Goran Wiper', '807-792-8149', 'gwiper9@ucoz.com');
insert into clients (name, phone, email) values ('Ramsay Sunderland', '236-641-8979', 'rsunderlanda@arstechnica.com');
insert into clients (name, phone, email) values ('Richy Wrey', '421-526-3135', 'rwreyb@issuu.com');
insert into clients (name, phone, email) values ('Suzanna Mc Curlye', '181-524-2263', 'smcc@geocities.com');
insert into clients (name, phone, email) values ('Fransisco Noir', '394-274-1910', 'fnoird@answers.com');
insert into clients (name, phone, email) values ('Joycelin Dupoy', '370-345-0364', 'jdupoye@51.la');
insert into clients (name, phone, email) values ('Edsel Bottini', '241-170-8627', 'ebottinif@ucsd.edu');
insert into clients (name, phone, email) values ('Ninetta Mordie', '412-102-9084', 'nmordieg@va.gov');
insert into clients (name, phone, email) values ('Eliot Heinle', '393-354-3047', 'eheinleh@xing.com');
insert into clients (name, phone, email) values ('Evvie Lansdowne', '759-339-2389', 'elansdownei@ustream.tv');
insert into clients (name, phone, email) values ('Betty Lambersen', '262-500-0120', 'blambersenj@aol.com');
insert into clients (name, phone, email) values ('Rita Klugel', '809-699-4344', 'rklugelk@biglobe.ne.jp');
insert into clients (name, phone, email) values ('Leese Tewes', '856-580-1212', 'ltewesl@seattletimes.com');
insert into clients (name, phone, email) values ('Yard Denman', '557-754-4511', 'ydenmanm@bluehost.com');
insert into clients (name, phone, email) values ('Isador Newcome', '837-903-8630', 'inewcomen@fema.gov');
insert into clients (name, phone, email) values ('Caleb Brew', '356-831-1395', 'cbrewo@hao123.com');
insert into clients (name, phone, email) values ('Granny Leebeter', '401-914-8397', 'gleebeterp@cornell.edu');
insert into clients (name, phone, email) values ('Nealson Prandin', '799-916-6612', 'nprandinq@indiegogo.com');
insert into clients (name, phone, email) values ('Rochette Warman', '349-252-9327', 'rwarmanr@wiley.com');
insert into clients (name, phone, email) values ('Randall Cruttenden', '149-709-1364', 'rcruttendens@biglobe.ne.jp');
insert into clients (name, phone, email) values ('Hedvig Dozdill', '351-173-9576', 'hdozdillt@toplist.cz');
insert into clients (name, phone, email) values ('Dolly Hansell', '899-590-7700', 'dhansellu@washingtonpost.com');
insert into clients (name, phone, email) values ('Yvonne Seabert', '574-188-1680', 'yseabertv@cloudflare.com');
insert into clients (name, phone, email) values ('Cassi Charer', '763-427-5645', 'ccharerw@microsoft.com');
insert into clients (name, phone, email) values ('Marie-ann Wilson', '609-996-7296', 'mwilsonx@wunderground.com');
insert into clients (name, phone, email) values ('Andriana Pennetta', '682-975-4218', 'apennettay@google.pl');
insert into clients (name, phone, email) values ('Brod Brownlie', '681-120-1580', 'bbrownliez@prweb.com');
insert into clients (name, phone, email) values ('Angelika Dawltrey', '686-627-0584', 'adawltrey10@utexas.edu');
insert into clients (name, phone, email) values ('Geraldine Barkes', '132-197-0656', 'gbarkes11@zdnet.com');
insert into clients (name, phone, email) values ('Rozalin Emlyn', '194-935-6104', 'remlyn12@craigslist.org');
insert into clients (name, phone, email) values ('Teddy Ambrosio', '722-756-5887', 'tambrosio13@chronoengine.com');
insert into clients (name, phone, email) values ('Felicio Rummer', '166-321-6519', 'frummer14@paypal.com');
insert into clients (name, phone, email) values ('Judi Buggs', '131-734-8659', 'jbuggs15@sciencedaily.com');
insert into clients (name, phone, email) values ('Delcine Stutte', '286-996-1026', 'dstutte16@gizmodo.com');
insert into clients (name, phone, email) values ('Emmalee Onyon', '321-860-7547', 'eonyon17@bloomberg.com');
insert into clients (name, phone, email) values ('Darryl Aarons', '106-692-0561', 'daarons18@timesonline.co.uk');
insert into clients (name, phone, email) values ('Fanechka Perazzo', '955-258-6564', 'fperazzo19@google.pl');
insert into clients (name, phone, email) values ('Minny Quinnelly', '868-619-5994', 'mquinnelly1a@cargocollective.com');
insert into clients (name, phone, email) values ('Nessy Swales', '441-898-1825', 'nswales1b@princeton.edu');
insert into clients (name, phone, email) values ('Maybelle Avo', '726-904-6818', 'mavo1c@oracle.com');
insert into clients (name, phone, email) values ('Ogdon Duffitt', '281-565-3239', 'oduffitt1d@howstuffworks.com');
insert into clients (name, phone, email) values ('Carolyne Maloney', '886-768-0394', 'cmaloney1e@dion.ne.jp');
insert into clients (name, phone, email) values ('Tades Challens', '666-714-1564', 'tchallens1f@engadget.com');
insert into clients (name, phone, email) values ('Brendan Orrum', '829-455-1211', 'borrum1g@indiegogo.com');
insert into clients (name, phone, email) values ('Ida Honack', '492-113-0954', 'ihonack1h@constantcontact.com');
insert into clients (name, phone, email) values ('Adelice Javes', '695-213-0571', 'ajaves1i@homestead.com');
insert into clients (name, phone, email) values ('Seymour Graser', '310-973-2248', 'sgraser1j@elpais.com');
insert into clients (name, phone, email) values ('Catarina Westell', '923-389-2000', 'cwestell1k@themeforest.net');
insert into clients (name, phone, email) values ('Karyl Gonin', '982-393-5052', 'kgonin1l@squidoo.com');
insert into clients (name, phone, email) values ('Mariel Da Costa', '158-713-4752', 'mda1m@twitter.com');
insert into clients (name, phone, email) values ('Noam Simco', '295-205-0334', 'nsimco1n@mysql.com');
insert into clients (name, phone, email) values ('Elbert Killwick', '978-754-5489', 'ekillwick1o@samsung.com');
insert into clients (name, phone, email) values ('Lonnard Scotchbrook', '381-810-7892', 'lscotchbrook1p@webmd.com');
insert into clients (name, phone, email) values ('Jilly Broxton', '576-657-4137', 'jbroxton1q@vk.com');
insert into clients (name, phone, email) values ('Frederica Eggleson', '240-964-8495', 'feggleson1r@howstuffworks.com');
insert into clients (name, phone, email) values ('Brit Broy', '788-795-4118', 'bbroy1s@typepad.com');
insert into clients (name, phone, email) values ('Hannie MacRory', '668-702-2607', 'hmacrory1t@e-recht24.de');
insert into clients (name, phone, email) values ('Ernesta Guitel', '600-851-4034', 'eguitel1u@ocn.ne.jp');
insert into clients (name, phone, email) values ('Amity Defraine', '210-735-2319', 'adefraine1v@economist.com');
insert into clients (name, phone, email) values ('Quintana Ferriday', '868-551-0756', 'qferriday1w@nationalgeographic.com');
insert into clients (name, phone, email) values ('Thaine Rampton', '374-409-5373', 'trampton1x@tiny.cc');
insert into clients (name, phone, email) values ('Faber Ranson', '970-393-1209', 'franson1y@t-online.de');
insert into clients (name, phone, email) values ('Alister Labrum', '395-486-9509', 'alabrum1z@ehow.com');
insert into clients (name, phone, email) values ('Carmelita Mettericke', '877-720-4314', 'cmettericke20@narod.ru');
insert into clients (name, phone, email) values ('Pearce Caughan', '569-580-6242', 'pcaughan21@ow.ly');
insert into clients (name, phone, email) values ('Barbaraanne Twinberrow', '987-697-2730', 'btwinberrow22@phpbb.com');
insert into clients (name, phone, email) values ('Eddy Normington', '166-472-0816', 'enormington23@sciencedaily.com');
insert into clients (name, phone, email) values ('Justin Osboldstone', '946-323-3026', 'josboldstone24@xrea.com');
insert into clients (name, phone, email) values ('Vincent Fahy', '952-825-8981', 'vfahy25@tiny.cc');
insert into clients (name, phone, email) values ('Hildagard Burgiss', '141-854-6674', 'hburgiss26@chron.com');
insert into clients (name, phone, email) values ('Bank Creak', '546-377-1364', 'bcreak27@mashable.com');
insert into clients (name, phone, email) values ('Rikki Ixor', '254-304-4824', 'rixor28@eventbrite.com');
insert into clients (name, phone, email) values ('Angel Ruskin', '347-536-0269', 'aruskin29@gov.uk');
insert into clients (name, phone, email) values ('Whitney Ingram', '865-795-7648', 'wingram2a@barnesandnoble.com');
insert into clients (name, phone, email) values ('Maye Element', '805-740-2483', 'melement2b@seesaa.net');
insert into clients (name, phone, email) values ('Stesha Haldon', '268-151-4037', 'shaldon2c@symantec.com');
insert into clients (name, phone, email) values ('Brooks Strangward', '939-839-3718', 'bstrangward2d@themeforest.net');
insert into clients (name, phone, email) values ('Wendell Neilan', '945-327-7378', 'wneilan2e@cmu.edu');
insert into clients (name, phone, email) values ('Beryl Kase', '895-330-8610', 'bkase2f@w3.org');
insert into clients (name, phone, email) values ('Koren Armand', '504-748-8391', 'karmand2g@google.fr');
insert into clients (name, phone, email) values ('Carey Neiland', '619-790-3613', 'cneiland2h@wufoo.com');
insert into clients (name, phone, email) values ('Odelle Cellier', '127-278-1011', 'ocellier2i@ucla.edu');
insert into clients (name, phone, email) values ('Heidie Makiver', '118-629-9370', 'hmakiver2j@virginia.edu');
insert into clients (name, phone, email) values ('Benji Dellatorre', '823-729-0829', 'bdellatorre2k@cyberchimps.com');
insert into clients (name, phone, email) values ('Carolin Lethby', '362-871-7301', 'clethby2l@intel.com');
insert into clients (name, phone, email) values ('Roze Chalcraft', '892-776-7625', 'rchalcraft2m@google.cn');
insert into clients (name, phone, email) values ('Niles Reddin', '752-978-1885', 'nreddin2n@usgs.gov');
insert into clients (name, phone, email) values ('Lucho Freckelton', '965-703-1328', 'lfreckelton2o@addthis.com');
insert into clients (name, phone, email) values ('Cammi Cess', '790-613-9989', 'ccess2p@dailymotion.com');
insert into clients (name, phone, email) values ('John O''Clery', '400-546-2227', 'joclery2q@sun.com');
insert into clients (name, phone, email) values ('Anya Benz', '149-748-8342', 'abenz2r@icq.com');
