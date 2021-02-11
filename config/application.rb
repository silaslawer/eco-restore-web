# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EcoRestoreWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.entity_definition = {
      "farmer": {
        "name": "Farmer",
        "detail": {
          "icon": "{{ farmer.photo }}",
          "title": "{{ farmer.name }}",
        },
        "hasMany": [
          {
            "entity": "farm",
            "source": "farmer",
          },
          {
            "entity": "wishlist",
            "source": "farmer",
          }
        ],
        "fields": {
          "consent": {
            "type": "bool",
            "label": "Consent",
            "description":
                "I consent to be registered as a project beneficiary and permit ECO RESTORE and their partners to collect, transfer, store and use MY DATA for ONLY the purposes to aid farmer insight and decision making.",
            "options": {
              "validation": {
                "required": true,
              }
            },
          },
          "consentVoice": {
            "type": "file",
            "label": "Q1.",
            "description": "Please record your evidence of consent Voice note",
            "options": {
              "widget": "audio",
              "validation": {
                "required": true,
              },
              "visible": "{{ farmer.consent }}",
            },
          },
          "name": {
            "type": "text",
            "label": "Q2.",
            "description": "Name of farmer",
            "options": {
              "validation": {
                "required": true,
              },
              "visible": "{{ farmer.consent }}",
            },
          },
          "region": {
            "label": "Q3.",
            "description": "Farmer Region",
            "options": {
              "widget": "select",
              "selections": [
                "North East",
                "Savannah",
                "Northern",
                "Upper West",
                "Upper East",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "district": {
            "label": "Q4.",
            "description": "Farmer District",
            "options": {
              "widget": "select",
              "selections": [
                "Bunkpurugu-Nyakpanduri",
                "Mamprugu Moagduri",
                "Chereponi",
                "West Mamprusi",
                "East Mamprusi",
                "Yunyoo-Nasuan",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "community": {
            "type": "text",
            "label": "Q5.",
            "description": "Farmer Community",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "ageRange": {
            "label": "Q6.",
            "description": "Age Range",
            "options": {
              "widget": "select",
              "selections": [
                "18 - 25",
                "26 - 35",
                "36 - 45",
                "46 - 55",
                "56 - 65",
                "66 and Above",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "sex": {
            "label": "Q7.",
            "description": "Gender",
            "options": {
              "widget": "select",
              "selections": [
                "Male",
                "Female",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "hasMobilePhone": {
            "type": "bool",
            "label": "Q8.",
            "description": "Do you own a mobile phone?",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "phoneTypes": {
            "label": "Q9.",
            "description": "What type of phone(s) do you use?",
            "options": {
              "widget": "picker",
              "selections": [
                "Feature phone",
                "Smart phone",
                "Basic, Zero Internet Access",
              ],
              "visible": "{{ farmer.consent and farmer.hasMobilePhone }}",
            },
          },
          "primaryPhoneNumber": {
            "label": "Q10.",
            "description": "Phone Number",
            "options": {
              "widget": "phone",
              "visible": "{{ farmer.consent and farmer.hasMobilePhone }}",
            },
          },
          "mobileMoneyNetwork": {
            "label": "Q11.",
            "description":
                "Which mobile network have you registered for Mobile Money?",
            "options": {
              "widget": "picker",
              "selections": [
                "MTN",
                "Vodafone",
                "Airtel Tigo Cash",
                "Other",
                "None",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "secondaryPhoneNumber": {
            "label": "Q12.",
            "description": "Phone Number 2",
            "options": {
              "widget": "phone",
              "visible": "{{ farmer.consent and farmer.hasMobilePhone }}",
            },
          },
          "nativeLanguage": {
            "label": "Q13.",
            "description": "Native Language",
            "options": {
              "widget": "select",
              "selections": [
                "Bimoba",
                "Bono",
                "Dagaare",
                "Twi",
                "Hausa",
                "Dagbani",
                "Dangme",
                "English",
                "Ewe",
                "Fante",
                "Ga",
                "Gonja",
                "Guruni",
                "Konkomba",
                "Kusaal",
                "Mampruli",
                "Moshi",
                "Nzema",
                "Sissaala",
                "Tampulma",
                "Waali",
                "French",
                "Other",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "otherNativeLanguages": {
            "type": "text",
            "label": "Q15.",
            "description": "Specify Other Language",
            "options": {
              "visible":
                  "{{ farmer.consent and farmer.nativeLanguage == 'Other' }}",
            },
          },
          "otherLanguages": {
            "label": "Q14.",
            "description": "Other Languages Spoken",
            "options": {
              "widget": "picker",
              "selections": [
                "Bimoba",
                "Bono",
                "Dagaare",
                "Dagbani",
                "Dangme",
                "Twi",
                "Hausa",
                "English",
                "Ewe",
                "Fante",
                "Ga",
                "Gonja",
                "Guruni",
                "Konkomba",
                "Kusaal",
                "Mampruli",
                "Moshi",
                "Nzema",
                "Sissaala",
                "Tampulma",
                "Waali",
                "French",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "canRead": {
            "type": "bool",
            "label": "Q15.",
            "description": "Do you read?",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "canReadLanguages": {
            "label": "Q16.",
            "description": "What languages do you read in?",
            "options": {
              "widget": "picker",
              "selections": [
                "Bimoba",
                "Bono",
                "Dagaare",
                "Dagbani",
                "Dangme",
                "English",
                "Ewe",
                "Fante",
                "Ga",
                "Gonja",
                "Guruni",
                "Konkomba",
                "Kusaal",
                "Mampruli",
                "Moshi",
                "Nzema",
                "Sissaala",
                "Tampulma",
                "Waali",
                "French",
              ],
              "visible": "{{ farmer.consent and farmer.canRead }}",
            },
          },
          "photo": {
            "type": "file",
            "label": "Q17.",
            "description": "Photo of Farmer Photo",
            "options": {
              "widget": "image",
              "visible": "{{ farmer.consent }}",
            },
          },
          "maritalStatus": {
            "label": "Q18.",
            "description": "Marital Status",
            "options": {
              "widget": "select",
              "selections": [
                "Married - One Spouse",
                "Married - Multiple Spouses",
                "Single / Never Married",
                "Divorced",
                "Widowed",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "numberOfSpouses": {
            "type": "int",
            "label": "Q19.",
            "description": "How many spouses?",
            "options": {
              "visible":
                  "{{ farmer.consent and farmer.maritalStatus == 'Married - Multiple Spouses' }}",
            },
          },
          "levelOfEducation": {
            "label": "Q20.",
            "description":
                "What is your highest level of education Level of education?",
            "options": {
              "widget": "select",
              "selections": [
                "No formal education",
                "Primary education",
                "Secondary education",
                "Tertiary education",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "rainySeasonTreeProducts": {
            "label": "Q21.",
            "description": "Rainy Season (May-Sept) - Harvesting Tree Products",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "rainySeasonCropVegetables": {
            "label": "Q22.",
            "description": "Rainy Season (May-Sept) - Farming Crops & Vegetables",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "rainySeasonLivestock": {
            "label": "Q23.",
            "description": "Rainy Season (May-Sept) - Livestock, Poultry & Fish",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "rainySeasonOther": {
            "label": "Q24.",
            "description": "Rainy Season (May-Sept) - Other Income Activities",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "drySeasonTreeProducts": {
            "label": "Q25.",
            "description": "Dry Season (Oct-April) - Harvesting Tree Products",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "drySeasonCropVegetables": {
            "label": "Q26.",
            "description": "Dry Season (Oct-April) - Farming Crops & Vegetables",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "drySeasonLivestock": {
            "label": "Q27.",
            "description": "Dry Season (Oct-April) - Livestock, Poultry & Fish",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "drySeasonOther": {
            "label": "Q28.",
            "description": "Dry Season (Oct-April) - Other Income Activities",
            "options": {
              "widget": "select",
              "selections": [
                "Minor <25%",
                "Secondary 25-50%",
                "Major >50%",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "treeProductsHarvested": {
            "label": "Q29.",
            "description": "Which Tree Products were harvested?",
            "options": {
              "widget": "picker",
              "selections": [
                "Shea",
                "Dawadawa",
                "Baobab",
                "Cashew",
                "Mango",
                "Kapok",
                "Timber",
                "Poles",
                "Firewood",
                "Charcoal",
                "Dyes",
                "Native fruits",
                "Fibre",
                "Medicines",
                "Mushrooms",
                "Other",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "otherTreeProductsHarvested": {
            "type": "text",
            "label": "Q30.",
            "description": "Specify Other Tree Products harvested",
            "options": {
              "visible":
                  "{{ farmer.consent and 'Other' in farmer.treeProductsHarvested }}",
            },
          },
          "majorCropsHarvested": {
            "label": "Q31.",
            "description": "Which Major Crops were harvested?",
            "options": {
              "widget": "picker",
              "selections": [
                "Rice",
                "Maize",
                "Sorghum",
                "Soya",
                "Groundnuts",
                "Beans",
                "Millet",
                "Cassava",
                "Other",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "otherMajorCropsHarvested": {
            "type": "text",
            "label": "Q32.",
            "description": "Specify Other Major Crops harvested",
            "options": {
              "visible":
                  "{{ farmer.consent and 'Other' in farmer.majorCropsHarvested }}",
            },
          },
          "minorCropsHarvested": {
            "label": "Q33.",
            "description": "Which Minor Crops were harvested?",
            "options": {
              "widget": "picker",
              "selections": [
                "Onion",
                "pigeon pea",
                "Tomato",
                "Yams",
                "Melons",
                "Leafy vegetables",
                "Pepper",
                "Other",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "otherMinorCropsHarvested": {
            "type": "text",
            "label": "Q34.",
            "description": "Specify Other Minor Crops harvested",
            "options": {
              "visible":
                  "{{ farmer.consent and 'Other' in farmer.minorCropsHarvested }}",
            },
          },
          "livestocksHarvested": {
            "label": "Q35.",
            "description": "Which livestock were kept?",
            "options": {
              "widget": "picker",
              "selections": [
                "Cows",
                "Goats",
                "Sheep",
                "Donkeys",
                "Pigs",
                "Chickens",
                "Guinea fowls",
                "Ducks",
                "Fishing",
                "Bushmeat",
                "Other",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "otherLivestocksHarvested": {
            "type": "text",
            "label": "Q36.",
            "description": "Specify Other Livestocks harvested",
            "options": {
              "visible":
                  "{{ farmer.consent and 'Other' in farmer.livestocksHarvested }}",
            },
          },
          "otherTownWork": {
            "label": "Q37.",
            "description": "Any other Town works?",
            "options": {
              "widget": "picker",
              "selections": [
                "Office work",
                "Trading bulk raw produce",
                "Agro-processing & sales of products",
                "Agri-equipment/chemicals",
                "Food vending",
                "Petty local trading",
                "Artisanal crafts",
                "Construction sector",
                "Transport sector",
                "Healthcare",
                "Hairdressing/personal care",
                "Media",
                "Other",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "otherOtherTownWork": {
            "type": "text",
            "label": "Q38.",
            "description": "Specify Other Town Work",
            "options": {
              "visible": "{{ farmer.consent and 'Other' in farmer.otherTownWork }}",
            },
          },
          "farmingExperience": {
            "type": "int",
            "label": "Q39.",
            "description": "Years of farming experience",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "numberOfFarms": {
            "type": "int",
            "label": "Q41.",
            "description": "How many farms do you have?",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "totalFarmAcreage": {
            "type": "double",
            "label": "Q43.",
            "description": "How many acres of farmland do you have?",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "farmingType": {
            "label": "Q40.",
            "description": "Farming Type",
            "options": {
              "widget": "select",
              "selections": [
                "Natural",
                "Chemical",
              ],
              "visible": "{{ farmer.consent }}",
            },
          },
          "hasCertification": {
            "type": "bool",
            "label": "Q4.",
            "description": "Do you have any certification for your crops?",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "certificationType": {
            "type": "text",
            "label": "Q45.",
            "description": "What type of certification?",
            "options": {
              "visible": "{{ farmer.consent and farmer.hasCertification }}",
            },
          },
          "dependantsCount": {
            "type": "int",
            "label": "Q46.",
            "description": "How many 7-14-year-old dependants do you have?",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "dependantsAttendedSchool": {
            "type": "int",
            "label": "Q46.",
            "description":
                "How many of your 7-14-year-old dependants attended school last year?",
            "options": {
              "visible": "{{ farmer.consent }}",
            },
          },
          "dependantsHighestSchool": {
            "label": "Q47.",
            "description":
                "What has been highest school level attended by any of your dependants?",
            "options": {
              "widget": "select",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "None",
                "Primary",
                "Secondary",
                "Tertiary",
              ],
            },
          },
          "householdHighProducedFood": {
            "label": "Q48.",
            "description":
                "Which of these home-produced foods are eaten in your household?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Eggs",
                "Meat",
                "leafy veggies",
                "Legumes (dawadawa, beans, g-nuts, etc.)",
              ],
            },
          },
          "householdVegetableOil": {
            "label": "Q49.",
            "description": "Which vegetable oils are eaten in your household?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Any refined oil",
                "Local palm ‘red-oil’",
                "Shea",
                "Groundnut",
                "Coconut",
                "Other",
              ],
            },
          },
          "otherHouseholdVegetableOil": {
            "type": "text",
            "label": "Q50.",
            "description": "Specify Other Household Eaten Oil",
            "options": {
              "visible":
                  "{{ farmer.consent and 'Other' in farmer.householdVegetableOil }}",
            },
          },
          "howOftenChildrenEatDairy": {
            "label": "Q51.",
            "description": "How often do the children eat dairy products?",
            "options": {
              "widget": "select",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Never",
                "Daily",
                "Weekly",
                "Monthly",
              ],
            },
          },
          "dairyType": {
            "label": "Q52.",
            "description": "Dairy Type",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Fulani milk",
                "Wagashi",
                "Powdered",
                "Tinned",
                "Carton",
                "Packaged cheese",
                "Other",
              ],
            },
          },
          "otherDairyType": {
            "type": "text",
            "label": "Q53.",
            "description": "Specify Other Dairy Type",
            "options": {
              "visible": "{{ farmer.consent and 'Other' in farmer.dairyType }}",
            },
          },
          "insuranceScheme": {
            "label": "Q54.",
            "description": "Registered on national health insurance?",
            "options": {
              "widget": "select",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "None",
                "Basic",
                "Premium",
              ],
            },
          },
          "actionOnMalaria": {
            "label": "Q55.",
            "description": "What did you do the last time a dependant had malaria?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Nothing",
                "Traditional medicine",
                "Pharmacy",
                "Clinic",
                "Hospital",
                "Other",
              ],
            },
          },
          "otherActionOnMalaria": {
            "type": "text",
            "label": "Q56.",
            "description": "Specify Other Action taken",
            "options": {
              "visible":
                  "{{ farmer.consent and 'Other' in farmer.actionOnMalaria }}",
            },
          },
          "mosquitoControlForChildren": {
            "label": "Q57.",
            "description": "What mosquito control practised for the children?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "None",
                "Bed-net",
                "Lotion/cream",
                "Burn coil",
                "Fan",
                "Other",
              ],
            },
          },
          "otherMosquitoControlForChildren": {
            "type": "text",
            "label": "Q58.",
            "description": "Specify Other Mosquito Control for Children",
            "options": {
              "visible":
                  "{{ farmer.consent and 'Other' in farmer.mosquitoControlForChildren }}",
            },
          },
          "lightSources": {
            "label": "Q59.",
            "description":
                "What “light” sources are available in household at night?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Electricity",
                "Solar",
                "Battery",
                "Torch",
                "Kerosene",
                "Candles",
                "Fire",
                "Other",
              ],
            },
          },
          "otherLightSources": {
            "type": "text",
            "label": "Q60.",
            "description": "Specify Other Light Sources",
            "options": {
              "visible": "{{ farmer.consent and 'Other' in farmer.lightSources }}",
            },
          },
          "cookingStoves": {
            "label": "Q61.",
            "description": "What cooking stoves are used in the household?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "3-stone fire",
                "Coal pot",
                "Improved stove",
                "Gas-table-top",
                "Gas-oven",
                "Electric oven",
                "Microwave",
              ],
            },
          },
          "cookingEnergy": {
            "label": "Q62.",
            "description": "What is your main daily “cooking” energy?",
            "options": {
              "widget": "select",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Firewood",
                "Charcoal",
                "LPG",
                "Electric",
              ],
            },
          },
          "roofType": {
            "label": "Q63.",
            "description": "What roof type does your home have?",
            "options": {
              "widget": "select",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Metal",
                "Adobe-wood beams",
                "Thatch-poles",
                "Clay tiles",
                "Other",
              ],
            },
          },
          "otherRoofType": {
            "type": "text",
            "label": "Q64.",
            "description": "Specify",
            "options": {
              "visible": "{{ farmer.consent and farmer.roofType == 'Other' }}",
            },
          },
          "appliancesOwned": {
            "label": "Q65.",
            "description":
                "Which of these modern appliances are owned by any household members?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Fridge/freezer",
                "Fan",
                "Aircon",
                "TV",
              ],
            },
          },
          "transportMeansOwned": {
            "label": "Q66.",
            "description":
                "Which of these transport options are owned by any household member?",
            "options": {
              "widget": "picker",
              "visible": "{{ farmer.consent }}",
              "selections": [
                "Bicycle",
                "Motorbike",
                "Donkey cart",
                "Yellow-yellow (tuk-tuk)",
                "Motor-king",
                "Car",
                "Lorry",
                "Tractor",
              ],
            },
          },
        }
      },
      "wishlist": {
        "name": "Wishlist",
        "detail": {
          "title": "{{ wishlist.farmer.name }}",
        },
        "fields": {
          "farmer": {
            "type": "reference",
            "label": "Farmer",
            "description": "Farmer",
            "options": {
              "referenceType": "farmer",
              "validation": {
                "required": true,
              },
            },
          },
          "afzelia": {
            "type": "int",
            "label": "Q1.",
            "description": "Afzelia",
            "options": {
            },
          },
          "balanites": {
            "type": "int",
            "label": "Q2.",
            "description": "Balanites",
            "options": {
            },
          },
          "baobab": {
            "type": "int",
            "label": "Q3.",
            "description": "Baobab",
            "options": {
            },
          },
          "black_berry": {
            "type": "int",
            "label": "Q4.",
            "description": "Black berry",
            "options": {
            },
          },
          "blood_plum": {
            "type": "int",
            "label": "Q5.",
            "description": "Blood plum",
            "options": {
            },
          },
          "camels_foot": {
            "type": "int",
            "label": "Q6.",
            "description": "Camels foot",
            "options": {
            },
          },
          "dawadawa": {
            "type": "int",
            "label": "Q7.",
            "description": "Dawadawa",
            "options": {
            },
          },
          "detarium": {
            "type": "int",
            "label": "Q8.",
            "description": "Detarium",
            "options": {
            },
          },
          "ebony": {
            "type": "int",
            "label": "Q9.",
            "description": "Ebony",
            "options": {
            },
          },
          "faidherbia": {
            "type": "int",
            "label": "Q10.",
            "description": "Faidherbia",
            "options": {
            },
          },
          "kapok": {
            "type": "int",
            "label": "Q11.",
            "description": "Kapok",
            "options": {
            },
          },
          "mahogany": {
            "type": "int",
            "label": "Q12.",
            "description": "Mahogany",
            "options": {
            },
          },
          "marula": {
            "type": "int",
            "label": "Q13.",
            "description": "Marula",
            "options": {
            },
          },
          "silver_butterfly": {
            "type": "int",
            "label": "Q14.",
            "description": "Silver butterfly",
            "options": {
            },
          },
          "simsabi": {
            "type": "int",
            "label": "Q15.",
            "description": "Simsabi",
            "options": {
            },
          },
          "sterculia": {
            "type": "int",
            "label": "Q16.",
            "description": "Sterculia",
            "options": {
            },
          },
          "tamarind": {
            "type": "int",
            "label": "Q17.",
            "description": "Tamarind",
            "options": {
            },
          },
          "velvet_tamarind": {
            "type": "int",
            "label": "Q18.",
            "description": "Velvet tamarind",
            "options": {
            },
          },
          "water_berries": {
            "type": "int",
            "label": "Q19.",
            "description": "Water berries",
            "options": {
            },
          },
          "shea": {
            "type": "int",
            "label": "Q20.",
            "description": "Shea",
            "options": {
            },
          },
        }
      },
      "farm": {
        "name": "Planting Location",
        "detail": {
          "title": "{{ farm.farmer.name }}",
          "subtitle": "# {{ farm.number }}",
        },
        "hasMany": [
          {
            "entity": "treeSeedling",
            "source": "farm",
          }
        ],
        "fields": {
          "farmer": {
            "type": "reference",
            "label": "Farmer",
            "description": "Current Farmer",
            "options": {
              "referenceType": "farmer",
              "validation": {
                "required": true,
              },
            },
          },
          "number": {
            "type": "text",
            "label": "Q1.",
            "description": "Location Number",
            "options": {
              "validation": {
                "required": true,
              },
            },
          },
          "type": {
            "label": "Q2.",
            "description": "Farm Type",
            "options": {
              "widget": "select",
              "selections": [
                "Commercial",
                "Peasant",
              ],
            },
          },
          "tenure": {
            "label": "Q3.",
            "description": "Tenure",
            "options": {
              "widget": "select",
              "selections": [
                "Informal agreement",
                "Marriage",
                "Formal rental",
                "Can sell",
                "Other",
              ],
            },
          },
          "otherTenure": {
            "type": "text",
            "label": "Q4.",
            "description": "Specify Other Tenure",
            "options": {
              "visible": "{{ farm.tenure == 'Other' }}",
              "validation": {
                "required": true,
              },
            },
          },
          "landscape": {
            "label": "Q5.",
            "description": "Farm Landscape",
            "options": {
              "widget": "select",
              "selections": [
                "Valley",
                "Slope",
                "Upland",
                "Flatland",
                "Other",
              ],
            },
          },
          "otherLandscape": {
            "type": "text",
            "label": "Q6.",
            "description": "Specify Other Landscape",
            "options": {
              "visible": "{{ farm.landscape == 'Other' }}",
              "validation": {
                "required": true,
              },
            },
          },
          "soilDescription": {
            "label": "Q7.",
            "description": "Soil Description",
            "options": {
              "widget": "select",
              "selections": [
                "Sandy soil (light, dry)",
                "Clay soil (heavy)",
                "Loam soil (mixture of sand, silt and clay)",
                "Silt Soil (fine, light and moisture retentive)",
                "Black Soil (high organic matter and retains large amount of moisture)",
                "Other",
              ],
            },
          },
          "otherSoilDescription": {
            "type": "text",
            "label": "Q8.",
            "description": "Specify Soil Description",
            "options": {
              "visible": "{{ farm.soilDescription == 'Other' }}",
              "validation": {
                "required": true,
              },
            },
          },
          "description": {
            "type": "text",
            "label": "Q9.",
            "description": "Farm Description",
            "options": {
              "widget": "multi_line",
            },
          },
          "farmingPractice": {
            "label": "Q10.",
            "description": "Which farming type do you practise?",
            "options": {
              "widget": "select",
              "selections": [
                "Use chemical inputs",
                "Only natural methods",
                "Other",
              ],
            },
          },
          "otherFarmPractice": {
            "type": "text",
            "label": "Q11.",
            "description": "Specify Other Farm Practice",
            "options": {
              "visible": "{{ farm.farmingPractice == 'Other' }}",
              "validation": {
                "required": true,
              },
            },
          },
          "size": {
            "type": "double",
            "label": "Q12.",
            "description": "What is the average size of this farm in acres?",
            "options": {
            },
          },
          "treePlantingNiche": {
            "label": "Q13.",
            "description": "Tree planting niches",
            "options": {
              "widget": "picker",
              "selections": [
                "On-farm",
                "Hedgerow",
                "Woodlot",
                "Alongside water body",
                "Home garden",
                "Village area",
                "Urban area",
                "Roadside",
                "Town park",
                "Schools grounds",
                "Hospital grounds",
                "Other",
              ],
            },
          },
          "seedlings": {
            "type": "int",
            "label": "Q14.",
            "description":
                "How many seedlings expected to be planted on this particular farm?",
            "options": {
            },
          },
          "entryPoint": {
            "label": "Q15.",
            "type": "geolocation",
            "description": "Farm Entry Point",
            "options": {
              "widget": "geolocation",
            },
          },
          "outline": {
            "label": "Q16.",
            "type": "geolocation",
            "description": "Farm/Planting Area",
            "options": {
              "widget": "geofence",
            },
          },
          "image1": {
            "type": "file",
            "label": "Q17.",
            "description": "Photo of Farm 1",
            "options": {
              "widget": "image",
            },
          },
          "image2": {
            "type": "file",
            "label": "Q18.",
            "description": "Photo of Farm 2",
            "options": {
              "widget": "image",
            },
          },
          "image3": {
            "type": "file",
            "label": "Q19.",
            "description": "Photo of Farm 3",
            "options": {
              "widget": "image",
            },
          },
        }
      },
      "treeSeedling": {
        "name": "Planted Seedling",
        "detail": {
          "title": "{{ treeSeedling.farm.farmer.name }}",
          "subtitle":
              "Farm # {{ treeSeedling.farm.number }}\n{{ treeSeedling.treeSpeciesPlanted }}",
        },
        "fields": {
          "farm": {
            "type": "reference",
            "label": "Farm",
            "description": "Farm",
            "options": {
              "referenceType": "farm",
              "validation": {
                "required": true,
              },
            },
          },
          "treeSpeciesPlanted": {
            "label": "Q1.",
            "description": "Tree species planted",
            "options": {
              "widget": "select",
              "selections": [
                "Shea",
                "Afzelia",
                "Faidherbia",
                "Balanites",
                "Kapok",
                "Baobab",
                "Mahogany",
                "Black berry",
                "Marula",
                "Daniellia",
                "Dawadawa",
                "Silver butterfly",
                "Detarium",
                "Sterculia",
                "Ebony",
                "Tamarind",
              ],
            },
          },
          "niche": {
            "label": "Q2.",
            "description": "Planted in which niche?",
            "options": {
              "widget": "select",
              "selections": [
                "Rural/farm",
                "Habitation areas",
              ],
            },
          },
          "ruralNicheDetails": {
            "label": "Q3.",
            "description": "Please specify rural niche",
            "options": {
              "widget": "select",
              "visible": "{{ treeSeedling.niche == 'Rural/farm' }}",
              "selections": [
                "Middle of farm",
                "Hedgerow/boundary",
                "Alongside water body",
                "Woodlot",
                "Roadside",
              ],
            },
          },
          "urbanNicheDetails": {
            "label": "Q4.",
            "description": "Please specify urban niche",
            "options": {
              "widget": "select",
              "visible": "{{ treeSeedling.niche == 'Habitation areas'}}",
              "selections": [
                "Urban area",
                "Town park",
                "Roadside",
                "Schools grounds",
                "Home garden",
                "Hospital grounds",
                "Village area",
                "Other",
              ],
            },
          },
          "otherUrbanNicheDetails": {
            "label": "Q5.",
            "type": "text",
            "description": "Please specify other urban niche",
            "options": {
              "visible": "{{ treeSeedling.urbanNicheDetails == 'Other' }}",
            },
          },
          "healthIssues": {
            "type": "text",
            "label": "Q6.",
            "description": "Health issues",
            "options": {
              "widget": "multi_line",
            },
          },
          "soilDescription": {
            "label": "Q7.",
            "description": "Soil description for exact planting spot",
            "options": {
              "widget": "select",
              "selections": [
                "Sandy soil (light, dry)",
                "Clay soil (heavy)",
                "Loam soil (mixture of sand, silt and clay)",
                "Silt Soil (fine, light and moisture retentive)",
                "Black Soil (high organic matter and retains large amount of moisture)",
                "Other",
              ],
            },
          },
          "otherSoilDescription": {
            "type": "text",
            "label": "Q8.",
            "description": "Specify Soil description for exact planting spot",
            "options": {
              "visible": "{{ treeSeedling.soilDescription == 'Other' }}",
              "validation": {
                "required": true,
              },
            },
          },
          "lastRainTime": {
            "label": "Q9.",
            "description": "When were last rains?",
            "options": {
              "widget": "select",
              "selections": [
                "Within last 24hrs",
                "within last 7 days",
                "Over 7 days ago",
              ],
            },
          },
          "weatherWhenPlanting": {
            "label": "Q10.",
            "description": "What weather when planting?",
            "options": {
              "widget": "select",
              "selections": [
                "Full sunshine",
                "Overcast",
                "Light rains",
                "Heavy rains",
              ],
            },
          },
          "photoOfHole": {
            "type": "file",
            "label": "Q13.",
            "description": "Photo of Hole",
            "options": {
              "widget": "image",
            },
          },
          "photoOfSeedling": {
            "type": "file",
            "label": "Q14.",
            "description": "Photo of Seedling",
            "options": {
              "widget": "image",
            },
          },
          "entryPoint": {
            "label": "Q16.",
            "type": "geolocation",
            "description": "GPS of planted seedling",
            "options": {
              "widget": "geolocation",
            },
          },
        }
      },
    };
  end
end
