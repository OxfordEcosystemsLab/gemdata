require 'spec_helper'
require 'csv'
require 'importer'

describe SpectraMeasurementImporter do

  it_behaves_like 'Importer'

  before :each do
    @leaf_part = set_up_leaf_part('ESP-01', 'T506', 'B1S', 'L1', 'L1C')
  end

  it 'can read csv' do
    values = CSV.parse_line "TL-ref,Esp011-T506-B1S,ESP01-T506-B1S,ESP01-T506-B1S-L1C1,84,1,,1,0.00097977,0.084537831,0.163531069,0.161660281,0.100591609,0.059415037,0.077740328,0.038658434,-0.02229633,0.062394689,0.099459567,0.07502167,0.093437106,0.099659559,0.014526975,-0.01672629,0.029606119,0.053983884,0.070470536,0.076304464,0.046391976,0.016480204,0.052083173,0.056773968,0.023931823,0.043315656,0.067938594,0.059822045,0.046580481,0.034784589,0.017980647,0.014091059,0.024096184,0.036618991,0.046071438,0.040231348,0.037426876,0.043518794,0.041324662,0.038407641,0.038464698,0.038890248,0.038009298,0.031128625,0.029655083,0.037600448,0.039141863,0.035220292,0.041711874,0.042718581,0.035349055,0.038626885,0.042772757,0.037610436,0.03809513,0.04294791,0.037584015,0.036193292,0.040001444,0.033792886,0.026875868,0.038998336,0.045017189,0.03839582,0.035489889,0.036613607,0.036454986,0.038903094,0.04231406,0.040949607,0.038439484,0.037321283,0.03709956,0.037321145,0.037223977,0.037870021,0.038472634,0.037343093,0.037551274,0.037645684,0.038648412,0.039611375,0.038725507,0.037496754,0.036507147,0.035384631,0.03554001,0.037885474,0.039536612,0.039305652,0.039431631,0.039853475,0.039577694,0.039697069,0.039460426,0.037076169,0.03679326,0.039250393,0.040486461,0.040677286,0.039720392,0.038689873,0.038330669,0.039690512,0.040785181,0.040329289,0.039545889,0.039289804,0.039444197,0.039843658,0.040665298,0.040507544,0.039962615,0.039925996,0.040088018,0.040256377,0.040757587,0.041090045,0.040301182,0.039971305,0.040262042,0.040313994,0.04049269,0.040640407,0.040585429,0.040519848,0.041102485,0.041288043,0.040981754,0.041275258,0.041638094,0.041115392,0.041133287,0.041589507,0.041057181,0.040597621,0.041033435,0.041517057,0.041705582,0.041465847,0.041477872,0.041804463,0.041403221,0.041186431,0.041725839,0.041908075,0.041681297,0.041637631,0.041839807,0.042414587,0.042376429,0.041835834,0.041638849,0.041706681,0.041900387,0.041963496,0.04207151,0.042029517,0.041888815,0.041796881,0.042126169,0.042503845,0.042463392,0.042614289,0.042713736,0.042570359,0.042375215,0.042284836,0.04274242,0.043366687,0.043450113,0.043378091,0.043353599,0.043382499,0.043492548,0.043673809,0.044174575,0.044723826,0.044819762,0.044747287,0.044777404,0.045496641,0.046287464,0.046169969,0.046331217,0.046960444,0.047371215,0.047877533,0.048640312,0.049326855,0.050018454,0.050710709,0.05142975,0.052138181,0.052966691,0.053880116,0.054819533,0.05571895,0.056604154,0.057466286,0.058527592,0.059761895,0.060569395,0.06117796,0.062117951,0.062945297,0.06355179,0.064184446,0.06483618,0.065202749,0.06551746,0.065927629,0.066549535,0.066927938,0.067011198,0.067229125,0.067557053,0.067920591,0.068064457,0.068040948,0.06830095,0.068669372,0.069026308,0.069221554,0.069277889,0.069397844,0.069603696,0.069801487,0.069652079,0.069319055,0.069311792,0.069264605,0.069031913,0.068858631,0.068592503,0.068048156,0.067564331,0.067149741,0.066448,0.065740414,0.065201968,0.064422754,0.063562792,0.062893309,0.062250735,0.061582649,0.060954532,0.060377232,0.059764855,0.059222403,0.058722354,0.058132195,0.05767299,0.057369849,0.056795469,0.056200303,0.056073072,0.05587317,0.05550845,0.05529185,0.055103425,0.054891116,0.054732732,0.054607588,0.054386614,0.05414822,0.053967123,0.05393152,0.053889394,0.053698482,0.053560199,0.053503074,0.053435615,0.053296677,0.053046944,0.052835385,0.052711375,0.052663391,0.052576035,0.052418932,0.052345931,0.052304246,0.052221806,0.052133101,0.05204465,0.051880104,0.051754907,0.05171529,0.051585423,0.051377746,0.051207133,0.051024977,0.050850451,0.050803995,0.050724188,0.05042407,0.050217857,0.050194874,0.050190411,0.050205622,0.050155772,0.05012953,0.050170206,0.050268977,0.050282782,0.050182911,0.050081161,0.050072089,0.050194423,0.050116076,0.04988496,0.049867396,0.049853765,0.049670771,0.049513774,0.049420737,0.049334467,0.049173181,0.048927747,0.048784887,0.04864716,0.048469791,0.048245024,0.048039347,0.048072258,0.048110749,0.048013998,0.047910447,0.047813199,0.047873081,0.047904996,0.047850378,0.047774655,0.047647619,0.047551177,0.047489507,0.047474366,0.047459213,0.047414797,0.047349912,0.04726006,0.047203382,0.047258791,0.047324748,0.047374613,0.047483089,0.047670437,0.047886191,0.048043561,0.048153411,0.048331933,0.048535934,0.048753144,0.049082762,0.049408679,0.049600648,0.049995906,0.050515554,0.050810047,0.051084475,0.051399881,0.051764047,0.052184418,0.052780838,0.053499279,0.054250198,0.054883811,0.055687003,0.056851635,0.058359797,0.060184497,0.062299744,0.064885682,0.068006013,0.071652686,0.075829251,0.080505044,0.085629775,0.09116002,0.097217702,0.103493576,0.109852295,0.116668021,0.123747157,0.130844829,0.138276241,0.14598979,0.153554041,0.161225634,0.169177954,0.177265237,0.185405143,0.193564473,0.201754137,0.209996715,0.218223278,0.226450885,0.234692948,0.242888237,0.250993133,0.258928134,0.266757483,0.274509925,0.28201412,0.289310486,0.296392357,0.303176051,0.309695502,0.316207981,0.322384423,0.328048145,0.333613187,0.339016505,0.344063663,0.34886046,0.353418869,0.357743725,0.361884018,0.365824981,0.36936315,0.372557464,0.375642291,0.37852808,0.381219681,0.383727136,0.386027204,0.388065233,0.38997923,0.391809247,0.393556106,0.395064728,0.396325573,0.39758328,0.398798874,0.399860769,0.400800709,0.401645272,0.402538499,0.403364134,0.404039493,0.404620766,0.4051351,0.405636808,0.406131989,0.406583573,0.406985223,0.407383136,0.407791073,0.408196739,0.408570966,0.408865514,0.409093418,0.409306019,0.40961537,0.409905604,0.410111303,0.410404429,0.410718831,0.41086747,0.41103285,0.411287334,0.411611906,0.411920718,0.412102254,0.412336206,0.41259653,0.412801398,0.412955186,0.413089047,0.413236107,0.413378536,0.413560045,0.413770072,0.414015584,0.414271762,0.414476115,0.414618949,0.414716784,0.414864501,0.415159308,0.415367167,0.415476951,0.415643809,0.41586408,0.416131226,0.416176771,0.416146158,0.416371542,0.416577009,0.416710954,0.416924552,0.417120973,0.417268552,0.417343161,0.417465286,0.417735607,0.4179488,0.418086448,0.418199643,0.41831846,0.418461192,0.418739511,0.419003332,0.419076258,0.419187056,0.419354476,0.419385612,0.419442083,0.419660132,0.419887219,0.420090086,0.420290612,0.420425907,0.420521765,0.420789415,0.421001683,0.421019938,0.421261282,0.421609128,0.421712977,0.421831343,0.422035568,0.422288056,0.422490485,0.422562343,0.422745574,0.423004767,0.423272289,0.42346177,0.423588502,0.423875667,0.424163985,0.424269337,0.424429244,0.424601184,0.424685937,0.424872397,0.42517941,0.425449847,0.425672964,0.425849346,0.425941542,0.42602275,0.426312484,0.426543369,0.426705549,0.426956024,0.427198065,0.427376547,0.427518795,0.427713083,0.427966605,0.42815553,0.428266128,0.428490701,0.428730787,0.42896027,0.429260073,0.429484416,0.429605805,0.429922614,0.430346604,0.430498195,0.430582989,0.430715291,0.431079439,0.431434645,0.43145957,0.431678653,0.432032935,0.432271063,0.432486051,0.43273409,0.432951112,0.433151925,0.433395956,0.433613567,0.433804409,0.433995743,0.434264784,0.434619491,0.434867693,0.435024767,0.435180594,0.435400042,0.43567215,0.436053093,0.436244103,0.43627409,0.436496591,0.436683605,0.436811297,0.436887907,0.437045442,0.437348518,0.437508307,0.437604547,0.437935526,0.438148349,0.438116355,0.438091131,0.438157519,0.438466666,0.438640567,0.43874626,0.439050178,0.439207685,0.439182345,0.43907102,0.438968075,0.438954506,0.438737388,0.438760586,0.439460509,0.439494967,0.439043292,0.439208492,0.439055418,0.438532247,0.438598337,0.438824295,0.438766516,0.438634724,0.438515457,0.438298456,0.438202116,0.438140949,0.437607517,0.437211521,0.436931634,0.436683635,0.436561657,0.436585532,0.436217174,0.435689499,0.435574291,0.435516456,0.435343409,0.434722405,0.434421809,0.434861714,0.434818267,0.434885774,0.435562028,0.435691308,0.435295637,0.435687759,0.435919351,0.435778526,0.435972627,0.435988591,0.435799883,0.435781525,0.435939315,0.436371077,0.436600304,0.436566154,0.436933932,0.437275706,0.437490603,0.437703949,0.438106336,0.438785688,0.438741852,0.438536912,0.439010521,0.439364848,0.43956365,0.439816738,0.440064251,0.440054657,0.440798383,0.441471668,0.441566706,0.441727931,0.441800475,0.441807904,0.442285217,0.442987645,0.44309344,0.443116155,0.44328778,0.443339437,0.443614217,0.444086836,0.444972061,0.445581532,0.445056904,0.444471533,0.444586321,0.444726964,0.445517072,0.447012022,0.447220689,0.447072422,0.447434095,0.447652639,0.447595244,0.44736335,0.447185246,0.44738284,0.448598653,0.449458478,0.449520946,0.449323167,0.448740711,0.448885453,0.449367129,0.449099148,0.448052174,0.449419006,0.450996055,0.449943052,0.449419953,0.449520459,0.450431812,0.450984508,0.451297351,0.450958388,0.450184352,0.449107523,0.450413871,0.452074631,0.452321605,0.453763598,0.456200327,0.4565076,0.455448665,0.454024477,0.453961578,0.454143369,0.4532618,0.45398231,0.454202678,0.453056434,0.453983204,0.455608638,0.455622402,0.455403193,0.455062533,0.454194986,0.453394341,0.453195316,0.454027731,0.453990371,0.451828134,0.449753192,0.449926075,0.452994126,0.454352289,0.454306229"
    importer = SpectraMeasurementImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    sm = importer.object.reload
    expect(sm).to be_valid
    expect(sm.leaf_part).to eq(@leaf_part)
    expect(sm.measurement_type).to eq('tl_ref')
    expect(sm.matlab_branch_code).to eq('Esp011-T506-B1S')
    expect(sm.original_code).to eq('ESP01-T506-B1S-L1C1')
    expect(sm.branch_number).to eq(84)
    expect(sm.leaf_number).to eq(1)
    expect(sm.comments).to eq(nil)
    expect(sm.quality_check).to eq(1)
    test_data = [0.00097977,0.084537831,0.163531069,0.161660281,0.100591609,0.059415037,0.077740328,0.038658434,-0.02229633,0.062394689,0.099459567,0.07502167,0.093437106,0.099659559,0.014526975,-0.01672629,0.029606119,0.053983884,0.070470536,0.076304464,0.046391976,0.016480204,0.052083173,0.056773968,0.023931823,0.043315656,0.067938594,0.059822045,0.046580481,0.034784589,0.017980647,0.014091059,0.024096184,0.036618991,0.046071438,0.040231348,0.037426876,0.043518794,0.041324662,0.038407641,0.038464698,0.038890248,0.038009298,0.031128625,0.029655083,0.037600448,0.039141863,0.035220292,0.041711874,0.042718581,0.035349055,0.038626885,0.042772757,0.037610436,0.03809513,0.04294791,0.037584015,0.036193292,0.040001444,0.033792886,0.026875868,0.038998336,0.045017189,0.03839582,0.035489889,0.036613607,0.036454986,0.038903094,0.04231406,0.040949607,0.038439484,0.037321283,0.03709956,0.037321145,0.037223977,0.037870021,0.038472634,0.037343093,0.037551274,0.037645684,0.038648412,0.039611375,0.038725507,0.037496754,0.036507147,0.035384631,0.03554001,0.037885474,0.039536612,0.039305652,0.039431631,0.039853475,0.039577694,0.039697069,0.039460426,0.037076169,0.03679326,0.039250393,0.040486461,0.040677286,0.039720392,0.038689873,0.038330669,0.039690512,0.040785181,0.040329289,0.039545889,0.039289804,0.039444197,0.039843658,0.040665298,0.040507544,0.039962615,0.039925996,0.040088018,0.040256377,0.040757587,0.041090045,0.040301182,0.039971305,0.040262042,0.040313994,0.04049269,0.040640407,0.040585429,0.040519848,0.041102485,0.041288043,0.040981754,0.041275258,0.041638094,0.041115392,0.041133287,0.041589507,0.041057181,0.040597621,0.041033435,0.041517057,0.041705582,0.041465847,0.041477872,0.041804463,0.041403221,0.041186431,0.041725839,0.041908075,0.041681297,0.041637631,0.041839807,0.042414587,0.042376429,0.041835834,0.041638849,0.041706681,0.041900387,0.041963496,0.04207151,0.042029517,0.041888815,0.041796881,0.042126169,0.042503845,0.042463392,0.042614289,0.042713736,0.042570359,0.042375215,0.042284836,0.04274242,0.043366687,0.043450113,0.043378091,0.043353599,0.043382499,0.043492548,0.043673809,0.044174575,0.044723826,0.044819762,0.044747287,0.044777404,0.045496641,0.046287464,0.046169969,0.046331217,0.046960444,0.047371215,0.047877533,0.048640312,0.049326855,0.050018454,0.050710709,0.05142975,0.052138181,0.052966691,0.053880116,0.054819533,0.05571895,0.056604154,0.057466286,0.058527592,0.059761895,0.060569395,0.06117796,0.062117951,0.062945297,0.06355179,0.064184446,0.06483618,0.065202749,0.06551746,0.065927629,0.066549535,0.066927938,0.067011198,0.067229125,0.067557053,0.067920591,0.068064457,0.068040948,0.06830095,0.068669372,0.069026308,0.069221554,0.069277889,0.069397844,0.069603696,0.069801487,0.069652079,0.069319055,0.069311792,0.069264605,0.069031913,0.068858631,0.068592503,0.068048156,0.067564331,0.067149741,0.066448,0.065740414,0.065201968,0.064422754,0.063562792,0.062893309,0.062250735,0.061582649,0.060954532,0.060377232,0.059764855,0.059222403,0.058722354,0.058132195,0.05767299,0.057369849,0.056795469,0.056200303,0.056073072,0.05587317,0.05550845,0.05529185,0.055103425,0.054891116,0.054732732,0.054607588,0.054386614,0.05414822,0.053967123,0.05393152,0.053889394,0.053698482,0.053560199,0.053503074,0.053435615,0.053296677,0.053046944,0.052835385,0.052711375,0.052663391,0.052576035,0.052418932,0.052345931,0.052304246,0.052221806,0.052133101,0.05204465,0.051880104,0.051754907,0.05171529,0.051585423,0.051377746,0.051207133,0.051024977,0.050850451,0.050803995,0.050724188,0.05042407,0.050217857,0.050194874,0.050190411,0.050205622,0.050155772,0.05012953,0.050170206,0.050268977,0.050282782,0.050182911,0.050081161,0.050072089,0.050194423,0.050116076,0.04988496,0.049867396,0.049853765,0.049670771,0.049513774,0.049420737,0.049334467,0.049173181,0.048927747,0.048784887,0.04864716,0.048469791,0.048245024,0.048039347,0.048072258,0.048110749,0.048013998,0.047910447,0.047813199,0.047873081,0.047904996,0.047850378,0.047774655,0.047647619,0.047551177,0.047489507,0.047474366,0.047459213,0.047414797,0.047349912,0.04726006,0.047203382,0.047258791,0.047324748,0.047374613,0.047483089,0.047670437,0.047886191,0.048043561,0.048153411,0.048331933,0.048535934,0.048753144,0.049082762,0.049408679,0.049600648,0.049995906,0.050515554,0.050810047,0.051084475,0.051399881,0.051764047,0.052184418,0.052780838,0.053499279,0.054250198,0.054883811,0.055687003,0.056851635,0.058359797,0.060184497,0.062299744,0.064885682,0.068006013,0.071652686,0.075829251,0.080505044,0.085629775,0.09116002,0.097217702,0.103493576,0.109852295,0.116668021,0.123747157,0.130844829,0.138276241,0.14598979,0.153554041,0.161225634,0.169177954,0.177265237,0.185405143,0.193564473,0.201754137,0.209996715,0.218223278,0.226450885,0.234692948,0.242888237,0.250993133,0.258928134,0.266757483,0.274509925,0.28201412,0.289310486,0.296392357,0.303176051,0.309695502,0.316207981,0.322384423,0.328048145,0.333613187,0.339016505,0.344063663,0.34886046,0.353418869,0.357743725,0.361884018,0.365824981,0.36936315,0.372557464,0.375642291,0.37852808,0.381219681,0.383727136,0.386027204,0.388065233,0.38997923,0.391809247,0.393556106,0.395064728,0.396325573,0.39758328,0.398798874,0.399860769,0.400800709,0.401645272,0.402538499,0.403364134,0.404039493,0.404620766,0.4051351,0.405636808,0.406131989,0.406583573,0.406985223,0.407383136,0.407791073,0.408196739,0.408570966,0.408865514,0.409093418,0.409306019,0.40961537,0.409905604,0.410111303,0.410404429,0.410718831,0.41086747,0.41103285,0.411287334,0.411611906,0.411920718,0.412102254,0.412336206,0.41259653,0.412801398,0.412955186,0.413089047,0.413236107,0.413378536,0.413560045,0.413770072,0.414015584,0.414271762,0.414476115,0.414618949,0.414716784,0.414864501,0.415159308,0.415367167,0.415476951,0.415643809,0.41586408,0.416131226,0.416176771,0.416146158,0.416371542,0.416577009,0.416710954,0.416924552,0.417120973,0.417268552,0.417343161,0.417465286,0.417735607,0.4179488,0.418086448,0.418199643,0.41831846,0.418461192,0.418739511,0.419003332,0.419076258,0.419187056,0.419354476,0.419385612,0.419442083,0.419660132,0.419887219,0.420090086,0.420290612,0.420425907,0.420521765,0.420789415,0.421001683,0.421019938,0.421261282,0.421609128,0.421712977,0.421831343,0.422035568,0.422288056,0.422490485,0.422562343,0.422745574,0.423004767,0.423272289,0.42346177,0.423588502,0.423875667,0.424163985,0.424269337,0.424429244,0.424601184,0.424685937,0.424872397,0.42517941,0.425449847,0.425672964,0.425849346,0.425941542,0.42602275,0.426312484,0.426543369,0.426705549,0.426956024,0.427198065,0.427376547,0.427518795,0.427713083,0.427966605,0.42815553,0.428266128,0.428490701,0.428730787,0.42896027,0.429260073,0.429484416,0.429605805,0.429922614,0.430346604,0.430498195,0.430582989,0.430715291,0.431079439,0.431434645,0.43145957,0.431678653,0.432032935,0.432271063,0.432486051,0.43273409,0.432951112,0.433151925,0.433395956,0.433613567,0.433804409,0.433995743,0.434264784,0.434619491,0.434867693,0.435024767,0.435180594,0.435400042,0.43567215,0.436053093,0.436244103,0.43627409,0.436496591,0.436683605,0.436811297,0.436887907,0.437045442,0.437348518,0.437508307,0.437604547,0.437935526,0.438148349,0.438116355,0.438091131,0.438157519,0.438466666,0.438640567,0.43874626,0.439050178,0.439207685,0.439182345,0.43907102,0.438968075,0.438954506,0.438737388,0.438760586,0.439460509,0.439494967,0.439043292,0.439208492,0.439055418,0.438532247,0.438598337,0.438824295,0.438766516,0.438634724,0.438515457,0.438298456,0.438202116,0.438140949,0.437607517,0.437211521,0.436931634,0.436683635,0.436561657,0.436585532,0.436217174,0.435689499,0.435574291,0.435516456,0.435343409,0.434722405,0.434421809,0.434861714,0.434818267,0.434885774,0.435562028,0.435691308,0.435295637,0.435687759,0.435919351,0.435778526,0.435972627,0.435988591,0.435799883,0.435781525,0.435939315,0.436371077,0.436600304,0.436566154,0.436933932,0.437275706,0.437490603,0.437703949,0.438106336,0.438785688,0.438741852,0.438536912,0.439010521,0.439364848,0.43956365,0.439816738,0.440064251,0.440054657,0.440798383,0.441471668,0.441566706,0.441727931,0.441800475,0.441807904,0.442285217,0.442987645,0.44309344,0.443116155,0.44328778,0.443339437,0.443614217,0.444086836,0.444972061,0.445581532,0.445056904,0.444471533,0.444586321,0.444726964,0.445517072,0.447012022,0.447220689,0.447072422,0.447434095,0.447652639,0.447595244,0.44736335,0.447185246,0.44738284,0.448598653,0.449458478,0.449520946,0.449323167,0.448740711,0.448885453,0.449367129,0.449099148,0.448052174,0.449419006,0.450996055,0.449943052,0.449419953,0.449520459,0.450431812,0.450984508,0.451297351,0.450958388,0.450184352,0.449107523,0.450413871,0.452074631,0.452321605,0.453763598,0.456200327,0.4565076,0.455448665,0.454024477,0.453961578,0.454143369,0.4532618,0.45398231,0.454202678,0.453056434,0.453983204,0.455608638,0.455622402,0.455403193,0.455062533,0.454194986,0.453394341,0.453195316,0.454027731,0.453990371,0.451828134,0.449753192,0.449926075,0.452994126,0.454352289,0.454306229]
    test_data.each_with_index do |val, idx|
      measurement = idx + 350
      expect(sm["measurement_#{measurement}"]).to eq(val)
    end
  end

end

