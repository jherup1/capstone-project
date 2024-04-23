import json


# Function to update the field
def main():

    #Load the JSON data
    with open("new_dataset.json", 'r') as file:
        data = json.load(file)

    #Iterate through each document and update the fields
    for entry in data:
        if 'institution.displayName' in entry and entry['institution.displayName'] != "N/A":
            entry['displayName'] = entry.pop('institution.displayName')
        elif 'institution.displayName' in entry:
            entry.pop('institution.displayName')
            entry['displayName'] = None
        else:
            entry['displayName'] = None

        if 'institution.schoolType' in entry and entry['institution.schoolType'] != "N/A":
            entry['schoolTypeNationalUniversities'] = entry.pop('institution.schoolType')
        elif 'institution.schoolType' in entry:
            entry.pop('institution.schoolType')
            entry['schoolTypeNationalUniversities'] = None
        else:
            entry['schoolTypeNationalUniversities'] = None

        if 'institution.aliasNames' in entry and entry['institution.aliasNames'] != "N/A":
            entry['aliasNames'] = entry.pop('institution.aliasNames')
        elif 'institution.aliasNames' in entry:
            entry.pop('institution.aliasNames')
            entry['aliasNames'] = None
        else:
            entry['aliasNames'] = None

        if 'institution.state' in entry and entry['institution.state'] != "N/A":
            entry['state'] = entry.pop('institution.state')
        elif 'institution.state' in entry:
            entry.pop('institution.state')
            entry['state'] = None
        else:
            entry['state'] = None

        if 'institution.city' in entry and entry['institution.city'] != "N/A":
            entry['city'] = entry.pop('institution.city')
        elif 'institution.city' in entry:
            entry.pop('institution.city')
            entry['city'] = None
        else:
            entry['city'] = None

        if 'institution.zip' in entry and entry['institution.zip'] != "N/A":
            entry['zip'] = entry.pop('institution.zip')
        elif 'institution.zip' in entry:
            entry.pop('institution.zip')
            entry['zip'] = None
        else:
            entry['zip'] = None

        if 'institution.region' in entry and entry['institution.region'] != "N/A":
            entry['region'] = entry.pop('institution.region')
        elif 'institution.region' in entry:
            entry.pop('institution.region')
            entry['region'] = None
        else:
            entry['region'] = None

        if 'institution.isPublic' in entry and entry['institution.isPublic'] != "N/A":
            entry['isPublic'] = entry.pop('institution.isPublic')
        elif 'institution.isPublic' in entry:
            entry.pop('institution.isPublic')
            entry['isPublic'] = None
        else:
            entry['isPublic'] = None

        if 'institution.institutionalControl' in entry and entry['institution.institutionalControl'] != "N/A":
            entry['institutionalControl'] = entry.pop('institution.institutionalControl')
        elif 'institution.institutionalControl' in entry:
            entry.pop('institution.institutionalControl')
            entry['institutionalControl'] = None
        else:
            entry['institutionalControl'] = None

        if 'institution.primaryPhotoCard' in entry and entry['institution.primaryPhotoCard'] != "N/A":
            entry['primaryPhoto'] = entry.pop('institution.primaryPhotoCard')
        elif 'institution.primaryPhotoCard' in entry:
            entry.pop('institution.primaryPhotoCard')
            entry['primaryPhoto'] = None
        else:
            entry['primaryPhoto'] = None

        if 'ranking.displayRank' in entry and entry['ranking.displayRank'] != "N/A":
            entry['rankingDisplayRank'] = entry.pop('ranking.displayRank')
        elif 'ranking.displayRank' in entry:
            entry.pop('ranking.displayRank')
            entry['rankingDisplayRank'] = None
        else:
            entry['rankingDisplayRank'] = None

        if 'ranking.sortRank' in entry and entry['ranking.sortRank'] != "N/A":
            entry['rankingSortRank'] = entry.pop('ranking.sortRank')
        elif 'ranking.sortRank' in entry:
            entry.pop('ranking.sortRank')
            entry['rankingSortRank'] = None
        else:
            entry['rankingSortRank'] = None

        if "ranking.isTied" in entry and entry["ranking.isTied"] != "N/A":
            entry['rankingIsTied'] = entry.pop('ranking.isTied')
        elif "ranking.isTied" in entry:
            entry.pop('ranking.isTied')
            entry['rankingIsTied'] = None
        else:
            entry['rankingIsTied'] = None

        if 'searchData.actAvg.rawValue' in entry and entry['searchData.actAvg.rawValue'] != "N/A":
            entry['actAvg'] = entry.pop('searchData.actAvg.rawValue')
        elif 'searchData.actAvg.rawValue' in entry:
            entry.pop('searchData.actAvg.rawValue')
            entry['actAvg'] = None
        else:
            entry['actAvg'] = None

        if 'searchData.percentReceivingAid.rawValue' in entry and entry['searchData.percentReceivingAid.rawValue'] != "N/A":
            entry['percentReceivingAid'] = entry.pop('searchData.percentReceivingAid.rawValue')
        elif 'searchData.percentReceivingAid.rawValue' in entry:
            entry.pop('searchData.percentReceivingAid.rawValue')
            entry['percentReceivingAid'] = None
        else:
            entry['percentReceivingAid'] = None

        if 'searchData.acceptanceRate.rawValue' in entry and entry['searchData.acceptanceRate.rawValue'] != "N/A":
            entry['acceptanceRate'] = entry.pop('searchData.acceptanceRate.rawValue')
        elif 'searchData.acceptanceRate.rawValue' in entry:
            entry.pop('searchData.acceptanceRate.rawValue')
            entry['acceptanceRate'] = None
        else:
            entry['acceptanceRate'] = None

        if 'searchData.tuition.rawValue' in entry and entry['searchData.tuition.rawValue'] != "N/A":
            entry['tuition'] = entry.pop('searchData.tuition.rawValue')
        elif 'searchData.tuition.rawValue' in entry:
            entry.pop('searchData.tuition.rawValue')
            entry['tuition'] = None
        else:
            entry['tuition'] = None

        if 'searchData.hsGpaAvg.rawValue' in entry and entry['searchData.hsGpaAvg.rawValue'] != "N/A":
            entry['hsGpaAvg'] = entry.pop('searchData.hsGpaAvg.rawValue')
        elif 'searchData.hsGpaAvg.rawValue' in entry:
            entry.pop('searchData.hsGpaAvg.rawValue')
            entry['hsGpaAvg'] = None
        else:
            entry['hsGpaAvg'] = None

        if 'searchData.engineeringRepScore.rawValue' in entry and entry['searchData.engineeringRepScore.rawValue'] != "N/A":
            entry['engineeringRepScore'] = entry.pop('searchData.engineeringRepScore.rawValue')
        elif 'searchData.engineeringRepScore.rawValue' in entry:
            entry.pop('searchData.engineeringRepScore.rawValue')
            entry['engineeringRepScore'] = None
        else:
            entry['engineeringRepScore'] = None
        
        if 'searchData.enrollment.rawValue' in entry and entry['searchData.enrollment.rawValue'] != "N/A":
            entry['enrollment'] = entry.pop('searchData.enrollment.rawValue')
        elif 'searchData.enrollment.rawValue' in entry:
            entry.pop('searchData.enrollment.rawValue')
            entry['enrollment'] = None
        else:
            entry['enrollment'] = None

        if 'searchData.businessRepScore.rawValue' in entry and entry['searchData.businessRepScore.rawValue'] != "N/A":
            entry['businessRepScore'] = entry.pop('searchData.businessRepScore.rawValue')
        elif 'searchData.businessRepScore.rawValue' in entry:
            entry.pop('searchData.businessRepScore.rawValue')
            entry['businessRepScore'] = None
        else:
            entry['businessRepScore'] = None
        
        if 'searchData.satAvg.rawValue' in entry and entry['searchData.satAvg.rawValue'] != "N/A":
            entry['satAvg'] = entry.pop('searchData.satAvg.rawValue')
        elif 'searchData.satAvg.rawValue' in entry:
            entry.pop('searchData.satAvg.rawValue')
            entry['satAvg'] = None
        else:
            entry['satAvg'] = None

        if 'searchData.costAfterAid.rawValue' in entry and entry['searchData.costAfterAid.rawValue'] != "N/A":
            entry['costAfterAid'] = entry.pop('searchData.costAfterAid.rawValue')
        elif 'searchData.costAfterAid.rawValue' in entry:
            entry.pop('searchData.costAfterAid.rawValue')
            entry['costAfterAid'] = None
        else:
            entry['costAfterAid'] = None

        if 'searchData.testAvgs.displayValue.0.value' in entry and entry['searchData.testAvgs.displayValue.0.value'] != "N/A":
            entry['satActRangeSAT'] = entry.pop('searchData.testAvgs.displayValue.0.value')
        elif 'searchData.testAvgs.displayValue.0.value' in entry:
            entry.pop('searchData.testAvgs.displayValue.0.value')
            entry['satActRangeSAT'] = None
        else:
            entry['satActRangeSAT'] = None

        if 'searchData.testAvgs.displayValue.1.value' in entry and entry['searchData.testAvgs.displayValue.1.value'] != "N/A":
            entry['satActRangeACT'] = entry.pop('searchData.testAvgs.displayValue.1.value')
        elif 'searchData.testAvgs.displayValue.1.value' in entry:
            entry.pop('searchData.testAvgs.displayValue.1.value')
            entry['satActRangeACT'] = None
        else:
            entry['satActRangeACT'] = None

        if 'School Type' in entry and entry['School Type'] != "N/A":
            entry['schoolType'] = entry.pop('School Type')
        elif 'School Type' in entry:
            entry.pop('School Type')
            entry['schoolType'] = None
        else:
            entry['schoolType'] = None

        if 'Year Founded' in entry and entry['Year Founded'] != "N/A":
            entry['yearFounded'] = entry.pop('Year Founded')
        elif 'Year Founded' in entry:
            entry.pop('Year Founded')
            entry['yearFounded'] = None
        else:
            entry['yearFounded'] = None

        if 'Religious Affiliation' in entry and entry['Religious Affiliation'] != "N/A":
            entry['religiousAffiliation'] = entry.pop('Religious Affiliation')
        elif 'Religious Affiliation' in entry:
            entry.pop('Religious Affiliation')
            entry['religiousAffiliation'] = None
        else:
            entry['religiousAffiliation'] = None

        if 'Academic Calendar' in entry and entry['Academic Calendar'] != "N/A":
            entry['academicCalendar'] = entry.pop('Academic Calendar')
        elif 'Academic Calendar' in entry:
            entry.pop('Academic Calendar')
            entry['academicCalendar'] = None
        else:
            entry['academicCalendar'] = None

        if 'Setting' in entry and entry['Setting'] != "N/A":
            entry['setting'] = entry.pop('Setting')
        elif 'Setting' in entry:
            entry.pop('Setting')
            entry['setting'] = None
        else:
            entry['setting'] = None

        if '2018 Endowment' in entry and entry['2018 Endowment'] != "N/A":
            entry['endowment2018'] = entry.pop('2018 Endowment')
        elif '2018 Endowment' in entry:
            entry.pop('2018 Endowment')
            entry['endowment2018'] = None
        else:
            entry['endowment2018'] = None

        if 'School Website' in entry and entry['School Website'] != "N/A":
            entry['schoolWebsite'] = entry.pop('School Website')
        elif 'School Website' in entry:
            entry.pop('School Website')
            entry['schoolWebsite'] = None
        else:
            entry['schoolWebsite'] = None

        if 'institution.address' in entry and entry['institution.address'] != "N/A":
            entry['address'] = entry.pop('institution.address')
        elif 'institution.address' in entry:
            entry.pop('institution.address')
            entry['address'] = None
        else:
            entry['address'] = None
        
        if 'institution.mygeopoint' in entry and entry['institution.mygeopoint'] != "N/A":
            entry['geoPoint'] = entry.pop('institution.mygeopoint')
        elif 'institution.mygeopoint' in entry:
            entry.pop('institution.mygeopoint')
            entry['geoPoint'] = None
        else:
            entry['geoPoint'] = None

        if 'institution.countryCode' in entry and entry['institution.countryCode'] != "N/A":
            entry['countryCode'] = entry.pop('institution.countryCode')
        elif 'institution.countryCode' in entry:
            entry.pop('institution.countryCode')
            entry['countryCode'] = None
        else:
            entry['countryCode'] = None

        if 'institution.description' in entry and entry['institution.description'] != "N/A":
            entry['description'] = entry.pop('institution.description')
        elif 'institution.description' in entry:
            entry.pop('institution.description')
            entry['description'] = None
        else:
            entry['description'] = None


    #Save updated JSON data
    with open("refactored_dataset.json", 'w') as file:
        json.dump(data, file, indent=4)

if __name__ == "__main__":
    main()