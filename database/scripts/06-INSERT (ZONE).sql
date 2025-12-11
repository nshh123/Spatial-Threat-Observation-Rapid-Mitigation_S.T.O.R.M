-- ZONE DATA

-- Main Surveillance Zones
INSERT INTO ZONE VALUES (1, 'Kigali CBD Zone', 'Central business district of Kigali', 'POLYGON((30.056 -1.944, 30.059 -1.946, 30.061 -1.943))', 2);
INSERT INTO ZONE VALUES (2, 'Kigali Airport Perimeter', 'Surveillance around Kigali International Airport', 'POLYGON((30.133 -1.968, 30.139 -1.972, 30.142 -1.965))', 4);
INSERT INTO ZONE VALUES (3, 'Kanombe Military Zone', 'Sensitive military air operations zone', 'POLYGON((30.112 -1.964, 30.118 -1.970, 30.120 -1.962))', 5);
INSERT INTO ZONE VALUES (4, 'Nyamirambo Sector', 'High-density residential zone in Kigali', 'POLYGON((30.047 -1.977, 30.050 -1.982, 30.052 -1.975))', 2);
INSERT INTO ZONE VALUES (5, 'Gikondo Industrial Zone', 'Industrial facilities requiring surveillance', 'POLYGON((30.063 -1.974, 30.068 -1.979, 30.071 -1.972))', 3);
INSERT INTO ZONE VALUES (6, 'Kimisagara Zone', 'Urban hotspot for crowd monitoring', 'POLYGON((30.042 -1.951, 30.047 -1.955, 30.049 -1.949))', 2);
INSERT INTO ZONE VALUES (7, 'Kacyiru Government Zone', 'Embassies and government offices', 'POLYGON((30.084 -1.935, 30.091 -1.939, 30.093 -1.933))', 4);
INSERT INTO ZONE VALUES (8, 'Remera Commercial Zone', 'Busy commercial and sports facilities', 'POLYGON((30.104 -1.951, 30.109 -1.957, 30.111 -1.949))', 3);
INSERT INTO ZONE VALUES (9, 'Kimironko Market Zone', 'Crowded market requiring aerial monitoring', 'POLYGON((30.119 -1.935, 30.124 -1.940, 30.126 -1.934))', 2);
INSERT INTO ZONE VALUES (10, 'Gasabo Wetland Buffer', 'Environmental monitoring area', 'POLYGON((30.090 -1.920, 30.094 -1.925, 30.096 -1.918))', 1);
INSERT INTO ZONE VALUES (11, 'Muhima Hospital Zone', 'Critical medical infrastructure', 'POLYGON((30.057 -1.944, 30.060 -1.947, 30.061 -1.942))', 3);
INSERT INTO ZONE VALUES (12, 'Kigali Convention Center Zone', 'Touristic and high-value infrastructure', 'POLYGON((30.080 -1.953, 30.084 -1.957, 30.086 -1.951))', 3);
INSERT INTO ZONE VALUES (13, 'Bumbogo Technology Hub', 'Industrial tech hub (RDB zone)', 'POLYGON((30.160 -1.913, 30.165 -1.918, 30.167 -1.911))', 3);
INSERT INTO ZONE VALUES (14, 'Gahanga Stadium Zone', 'Sports infrastructure surveillance', 'POLYGON((30.096 -1.995, 30.100 -1.999, 30.103 -1.992))', 2);
INSERT INTO ZONE VALUES (15, 'Bugesera Airport Construction Zone', 'Long-range airport construction area', 'POLYGON((30.280 -2.210, 30.285 -2.216, 30.287 -2.209))', 4);

-- District-level surveillance zones
INSERT INTO ZONE VALUES (16, 'Huye District Central Zone', 'Urban district center', 'POLYGON((29.740 -2.596, 29.744 -2.600, 29.746 -2.594))', 2);
INSERT INTO ZONE VALUES (17, 'Butare University Zone', 'University premises aerial monitoring', 'POLYGON((29.739 -2.608, 29.742 -2.612, 29.744 -2.606))', 3);
INSERT INTO ZONE VALUES (18, 'Nyanza King’s Palace Zone', 'Cultural heritage site', 'POLYGON((29.750 -2.357, 29.753 -2.362, 29.756 -2.356))', 2);
INSERT INTO ZONE VALUES (19, 'Muhanga Urban Zone', 'Mid-size city requiring security monitoring', 'POLYGON((29.740 -2.150, 29.744 -2.154, 29.746 -2.149))', 2);
INSERT INTO ZONE VALUES (20, 'Ruhango Agricultural Zone', 'Large-scale farmland area', 'POLYGON((29.770 -2.233, 29.774 -2.238, 29.776 -2.231))', 1);
INSERT INTO ZONE VALUES (21, 'Gisagara Border Zone', 'Perimeter near Burundi border', 'POLYGON((29.870 -2.585, 29.874 -2.590, 29.876 -2.584))', 4);
INSERT INTO ZONE VALUES (22, 'Nyamagabe Forest Zone', 'Vegetation-heavy area requiring fire monitoring', 'POLYGON((29.500 -2.485, 29.506 -2.490, 29.508 -2.483))', 3);
INSERT INTO ZONE VALUES (23, 'Nyaruguru Highlands Zone', 'Mountain region surveillance', 'POLYGON((29.740 -2.764, 29.744 -2.769, 29.746 -2.762))', 2);

-- National parks & conservation surveillance zones
INSERT INTO ZONE VALUES (24, 'Nyungwe National Park Core', 'Primary conservation zone', 'POLYGON((29.200 -2.350, 29.210 -2.360, 29.220 -2.340))', 5);
INSERT INTO ZONE VALUES (25, 'Nyungwe Eastern Buffer', 'Forest buffer area', 'POLYGON((29.270 -2.430, 29.280 -2.440, 29.290 -2.420))', 3);
INSERT INTO ZONE VALUES (26, 'Nyungwe Poaching Risk Zone', 'High-risk anti-poaching corridor', 'POLYGON((29.180 -2.380, 29.190 -2.390, 29.200 -2.370))', 5);
INSERT INTO ZONE VALUES (27, 'Akagera National Park North', 'Wildlife and anti-poaching monitoring', 'POLYGON((30.620 -1.200, 30.630 -1.210, 30.640 -1.190))', 4);
INSERT INTO ZONE VALUES (28, 'Akagera Lakeside Zone', 'Lake-side aerial surveillance', 'POLYGON((30.700 -1.650, 30.710 -1.660, 30.720 -1.640))', 3);
INSERT INTO ZONE VALUES (29, 'Akagera Border Patrol Zone', 'Critical border monitoring zone', 'POLYGON((30.800 -1.450, 30.810 -1.460, 30.820 -1.440))', 5);
INSERT INTO ZONE VALUES (30, 'Volcanoes National Park Core', 'Mountain gorilla habitat zone', 'POLYGON((29.520 -1.470, 29.530 -1.480, 29.540 -1.460))', 5);
INSERT INTO ZONE VALUES (31, 'Volcanoes Southern Entry', 'Tourist entry point', 'POLYGON((29.550 -1.490, 29.560 -1.500, 29.570 -1.485))', 3);
INSERT INTO ZONE VALUES (32, 'Volcanoes Poaching Risk Corridor', 'High-risk corridor for illegal activity', 'POLYGON((29.480 -1.430, 29.490 -1.440, 29.500 -1.425))', 5);

-- Western province lake surveillance
INSERT INTO ZONE VALUES (33, 'Rubavu Lakefront Zone', 'Lake Kivu port zone', 'POLYGON((29.270 -1.690, 29.280 -1.700, 29.290 -1.685))', 3);
INSERT INTO ZONE VALUES (34, 'Karongi Lakefront Zone', 'Touristic waterfront area', 'POLYGON((29.400 -2.045, 29.410 -2.055, 29.420 -2.040))', 2);
INSERT INTO ZONE VALUES (35, 'Rutsiro Fisheries Zone', 'Fishing and lake monitoring area', 'POLYGON((29.350 -1.950, 29.360 -1.960, 29.370 -1.945))', 1);
INSERT INTO ZONE VALUES (36, 'Rusizi Border Zone', 'Border crossing surveillance zone', 'POLYGON((28.890 -2.490, 28.900 -2.500, 28.910 -2.485))', 4);
INSERT INTO ZONE VALUES (37, 'Rusizi Airport Zone', 'Small airfield surveillance', 'POLYGON((28.890 -2.460, 28.895 -2.465, 28.900 -2.458))', 3);

-- Northern province zones
INSERT INTO ZONE VALUES (38, 'Musanze Urban Zone', 'High-population district', 'POLYGON((29.630 -1.500, 29.635 -1.505, 29.640 -1.498))', 2);
INSERT INTO ZONE VALUES (39, 'Gicumbi Border Surveillance', 'Zone near northern border', 'POLYGON((30.080 -1.480, 30.085 -1.485, 30.090 -1.475))', 4);
INSERT INTO ZONE VALUES (40, 'Burera Lake Basin', 'Environmental monitoring zone', 'POLYGON((29.850 -1.400, 29.860 -1.410, 29.870 -1.395))', 2);
INSERT INTO ZONE VALUES (41, 'Rulindo Highlands', 'Hilly surveillance terrain', 'POLYGON((29.960 -1.720, 29.965 -1.725, 29.970 -1.718))', 2);
INSERT INTO ZONE VALUES (42, 'Gakenke Agricultural Zone', 'Large farming belt', 'POLYGON((29.900 -1.670, 29.905 -1.675, 29.910 -1.668))', 1);

-- Eastern province town/corridor monitoring
INSERT INTO ZONE VALUES (43, 'Rwamagana Urban Zone', 'Regional commercial center', 'POLYGON((30.440 -1.960, 30.445 -1.965, 30.450 -1.958))', 2);
INSERT INTO ZONE VALUES (44, 'Kayonza Transport Hub', 'High-traffic junction', 'POLYGON((30.660 -1.860, 30.665 -1.865, 30.670 -1.858))', 3);
INSERT INTO ZONE VALUES (45, 'Kirehe Border Corridor', 'Critical surveillance zone near Tanzania border', 'POLYGON((30.850 -2.270, 30.855 -2.275, 30.860 -2.268))', 4);
INSERT INTO ZONE VALUES (46, 'Ngoma Wetland Zone', 'Environmental protection area', 'POLYGON((30.500 -2.150, 30.505 -2.155, 30.510 -2.148))', 1);
INSERT INTO ZONE VALUES (47, 'Bugesera Dry Zone', 'Dry savannah area needing fire monitoring', 'POLYGON((30.350 -2.100, 30.355 -2.105, 30.360 -2.098))', 2);

-- Kigali extended zones
INSERT INTO ZONE VALUES (48, 'Kigali Outer Ring Road Zone', 'Highway aerial monitoring', 'POLYGON((30.100 -1.960, 30.105 -1.965, 30.110 -1.958))', 2);
INSERT INTO ZONE VALUES (49, 'Masaka Industrial Park', 'New industrial development area', 'POLYGON((30.170 -1.985, 30.175 -1.990, 30.180 -1.983))', 3);
INSERT INTO ZONE VALUES (50, 'Kabuga Urban Expansion', 'Rapidly developing peri-urban zone', 'POLYGON((30.200 -1.940, 30.205 -1.945, 30.210 -1.938))', 2);

-- Additional zones
INSERT INTO ZONE VALUES (51, 'Gisozi Genocide Memorial Zone', 'High-security memorial area', 'POLYGON((30.058 -1.926, 30.062 -1.930, 30.064 -1.924))', 3);
INSERT INTO ZONE VALUES (52, 'Kibagabaga Hospital Zone', 'Healthcare monitoring area', 'POLYGON((30.108 -1.928, 30.112 -1.932, 30.114 -1.926))', 3);
INSERT INTO ZONE VALUES (53, 'Kabuye Industrial Plant', 'Factory and emissions monitoring', 'POLYGON((30.020 -1.900, 30.025 -1.905, 30.028 -1.898))', 3);
INSERT INTO ZONE VALUES (54, 'Kigali University Zone', 'Education campus surveillance', 'POLYGON((30.075 -1.959, 30.078 -1.963, 30.082 -1.957))', 2);
INSERT INTO ZONE VALUES (55, 'Kigali Mountain Ridge', 'Hilly zone monitoring', 'POLYGON((30.030 -1.910, 30.036 -1.915, 30.038 -1.909))', 1);
INSERT INTO ZONE VALUES (56, 'Gahanga Industrial Expansion', 'Manufacturing construction zone', 'POLYGON((30.099 -2.000, 30.103 -2.004, 30.106 -1.999))', 3);
INSERT INTO ZONE VALUES (57, 'Bugesera Wetland Restoration', 'Environmental protection', 'POLYGON((30.360 -2.240, 30.364 -2.244, 30.368 -2.238))', 1);
INSERT INTO ZONE VALUES (58, 'Ruhondo Lake Zone', 'Northern lake surveillance', 'POLYGON((29.780 -1.385, 29.785 -1.390, 29.790 -1.382))', 2);
INSERT INTO ZONE VALUES (59, 'Mukamira Military Perimeter', 'Military training zone', 'POLYGON((29.580 -1.610, 29.586 -1.615, 29.589 -1.608))', 5);
INSERT INTO ZONE VALUES (60, 'Gishwati Forest Edge', 'Forest and biodiversity monitoring', 'POLYGON((29.540 -1.670, 29.545 -1.675, 29.550 -1.668))', 4);
INSERT INTO ZONE VALUES (61, 'Nyabihu Landslide Risk Zone', 'High-risk landslide monitoring area', 'POLYGON((29.600 -1.610, 29.606 -1.615, 29.609 -1.608))', 5);
INSERT INTO ZONE VALUES (62, 'Rubavu-Goma Border Zone', 'High-security international border', 'POLYGON((29.260 -1.690, 29.268 -1.695, 29.270 -1.688))', 5);
INSERT INTO ZONE VALUES (63, 'Kigeme Refugee Camp Zone', 'Humanitarian monitoring zone', 'POLYGON((29.630 -2.480, 29.635 -2.485, 29.640 -2.478))', 4);
INSERT INTO ZONE VALUES (64, 'Nyanza Urban Expansion', 'Developing district town area', 'POLYGON((29.740 -2.330, 29.745 -2.335, 29.750 -2.328))', 2);
INSERT INTO ZONE VALUES (65, 'Kirehe Highlands Dry Zone', 'Dry highland requiring fire monitoring', 'POLYGON((30.780 -2.115, 30.785 -2.120, 30.790 -2.113))', 3);
INSERT INTO ZONE VALUES (66, 'Kayonza Valley Wetland', 'Flood-prone valley', 'POLYGON((30.600 -1.925, 30.605 -1.930, 30.610 -1.923))', 3);
INSERT INTO ZONE VALUES (67, 'Rwamagana Industrial Expansion', 'Manufacturing and warehousing', 'POLYGON((30.450 -1.995, 30.456 -2.000, 30.460 -1.993))', 3);
INSERT INTO ZONE VALUES (68, 'Gatsibo Pastoral Zone', 'Livestock monitoring', 'POLYGON((30.590 -1.620, 30.595 -1.625, 30.600 -1.618))', 1);
INSERT INTO ZONE VALUES (69, 'Nyagatare University Zone', 'Educational and youth area', 'POLYGON((30.470 -1.310, 30.480 -1.315, 30.485 -1.308))', 2);
INSERT INTO ZONE VALUES (70, 'Nyagatare Border Zone', 'High-security Tanzania border', 'POLYGON((30.530 -1.390, 30.535 -1.395, 30.540 -1.388))', 4);

INSERT INTO ZONE VALUES (71, 'Kagitumba Custom Zone', 'Customs and cargo monitoring', 'POLYGON((30.470 -1.050, 30.475 -1.055, 30.480 -1.048))', 3);
INSERT INTO ZONE VALUES (72, 'Bwisige Agricultural Zone', 'Large plantation area', 'POLYGON((30.030 -1.550, 30.036 -1.556, 30.040 -1.548))', 1);
INSERT INTO ZONE VALUES (73, 'Byumba Ridge Zone', 'Hilly terrain monitoring', 'POLYGON((30.100 -1.600, 30.105 -1.605, 30.110 -1.598))', 2);
INSERT INTO ZONE VALUES (74, 'Rugando Urban Expansion', 'Growing Kigali suburb', 'POLYGON((30.090 -1.945, 30.095 -1.950, 30.099 -1.943))', 2);
INSERT INTO ZONE VALUES (75, 'Ndera Psychiatric Hospital Zone', 'Critical health infrastructure', 'POLYGON((30.150 -1.940, 30.155 -1.945, 30.159 -1.938))', 3);
INSERT INTO ZONE VALUES (76, 'Kimironko Residential Zone', 'High-density housing area', 'POLYGON((30.123 -1.933, 30.126 -1.937, 30.130 -1.931))', 2);
INSERT INTO ZONE VALUES (77, 'Gatsata Slope Monitoring', 'Landslide-prone urban area', 'POLYGON((30.043 -1.925, 30.047 -1.929, 30.050 -1.924))', 4);
INSERT INTO ZONE VALUES (78, 'Nyacyonga River Buffer', 'Flood monitoring along Nyabugogo river', 'POLYGON((30.030 -1.930, 30.034 -1.934, 30.038 -1.928))', 3);
INSERT INTO ZONE VALUES (79, 'Juru Hill Observation Zone', 'High-altitude observation site', 'POLYGON((30.200 -1.980, 30.205 -1.985, 30.210 -1.979))', 2);
INSERT INTO ZONE VALUES (80, 'Kanazi Industrial Zone', 'Industrial plants near Bugesera', 'POLYGON((30.330 -2.060, 30.335 -2.065, 30.339 -2.058))', 3);
INSERT INTO ZONE VALUES (81, 'Nyamata Urban Zone', 'Developing district headquarters', 'POLYGON((30.320 -2.150, 30.325 -2.155, 30.329 -2.148))', 2);
INSERT INTO ZONE VALUES (82, 'Gatenga Residential Zone', 'Crowded Kigali suburb', 'POLYGON((30.080 -1.980, 30.085 -1.984, 30.089 -1.978))', 2);
INSERT INTO ZONE VALUES (83, 'Kicukiro Administrative Zone', 'District HQ and public services', 'POLYGON((30.089 -1.947, 30.092 -1.950, 30.095 -1.945))', 3);
INSERT INTO ZONE VALUES (84, 'Masoro Special Economic Zone', 'Industrial manufacturing hub', 'POLYGON((30.150 -1.902, 30.156 -1.908, 30.160 -1.900))', 4);
INSERT INTO ZONE VALUES (85, 'Rwampara Military Ridge', 'High-security military ridge', 'POLYGON((30.110 -1.970, 30.115 -1.976, 30.119 -1.968))', 5);
INSERT INTO ZONE VALUES (86, 'Kigali Slum Redevelopment Zone', 'Urban regeneration area', 'POLYGON((30.060 -1.955, 30.065 -1.960, 30.070 -1.953))', 2);
INSERT INTO ZONE VALUES (87, 'Kigali Wetland Restoration', 'Wetland rehabilitation monitoring', 'POLYGON((30.090 -1.960, 30.095 -1.965, 30.100 -1.958))', 1);
INSERT INTO ZONE VALUES (88, 'Nyarutarama Luxury Estates', 'Premium security monitoring area', 'POLYGON((30.100 -1.940, 30.105 -1.944, 30.109 -1.938))', 3);
INSERT INTO ZONE VALUES (89, 'Gacuriro Estates Zone', 'Suburban residential zone', 'POLYGON((30.085 -1.928, 30.089 -1.933, 30.092 -1.927))', 2);
INSERT INTO ZONE VALUES (90, 'Kibungo Urban Zone', 'Eastern province commerce center', 'POLYGON((30.540 -2.160, 30.545 -2.165, 30.550 -2.158))', 2);

INSERT INTO ZONE VALUES (91, 'Nemba Border Zone', 'Important Burundi border crossing', 'POLYGON((29.870 -1.790, 29.875 -1.795, 29.880 -1.788))', 4);
INSERT INTO ZONE VALUES (92, 'Ruli Mining Zone', 'Artisanal mining surveillance', 'POLYGON((29.890 -1.610, 29.895 -1.615, 29.900 -1.608))', 3);
INSERT INTO ZONE VALUES (93, 'Nyagatare Pastoral Corridor', 'Livestock cross-border migration', 'POLYGON((30.510 -1.350, 30.515 -1.355, 30.520 -1.348))', 2);
INSERT INTO ZONE VALUES (94, 'Ruhengeri Market Zone', 'High-density commercial activity', 'POLYGON((29.630 -1.515, 29.635 -1.520, 29.640 -1.513))', 3);
INSERT INTO ZONE VALUES (95, 'Gatuna One-Stop Border Post', 'Strategic Uganda border', 'POLYGON((30.080 -1.300, 30.085 -1.305, 30.090 -1.298))', 5);
INSERT INTO ZONE VALUES (96, 'Kagitumba Pastoral Wetland', 'Wetland–pasture balance monitoring', 'POLYGON((30.480 -1.090, 30.485 -1.095, 30.490 -1.088))', 2);
INSERT INTO ZONE VALUES (97, 'Shyorongi Northern Entry', 'Key entry route to Kigali', 'POLYGON((30.000 -1.860, 30.005 -1.865, 30.010 -1.858))', 3);
INSERT INTO ZONE VALUES (98, 'Nyamasheke Tea Zone', 'Tea plantation monitoring', 'POLYGON((29.170 -2.240, 29.176 -2.245, 29.180 -2.238))', 1);
INSERT INTO ZONE VALUES (99, 'Kirehe Savannah Zone', 'Fire-prone savannah region', 'POLYGON((30.750 -2.200, 30.755 -2.205, 30.760 -2.198))', 3);
INSERT INTO ZONE VALUES (100, 'Kagugu Residential Zone', 'Rapid-growth housing area', 'POLYGON((30.081 -1.909, 30.086 -1.914, 30.090 -1.907))', 2);
