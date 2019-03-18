#!/usr/bin/python

import urllib2, json, base64, urllib

# define variable
strBaseUrl='https://xxx.xxx.xxx/api/Public/'
srtEndpoint='PupilsFurtherDetails/GetCurrentPupilComplexDetails'
strDomain='XXX'

# decode base64 API token - use base64.b64encode(strToken) to encrypt the token
strEncrypted=''
strToken=base64.b64decode(strEncrypted)

# connect to Schoolbase API and retrieve result
request = urllib2.Request(strBaseUrl + srtEndpoint)
request.add_header('x-schoolbase-domain', strDomain)
request.add_header('x-schoolbase-token', strToken)
request.get_method = lambda: 'POST'

#### get all record
#result = urllib2.urlopen(request).read()

#### get individual record by Student ID
data = {'PupOrigNums': '4111'}
result = urllib2.urlopen(request, urllib.urlencode(data)).read()

# load web result into JSON and sort by LastName
objJson=json.loads(result)
sorted(objJson, key = lambda i: i['LastName']) 

# retrieve the infomation from JSON
intCount = 0
for student in objJson:
	if student['YearGroup'] > 9 and student['YearGroup'] < 45:
		print student['FirstName'] + ' ' + student['LastName']
		intCount += 1
	#Keys: 'HomeAddressLine6', 'HomeAddressLine5', 'HomeAddressLine4', 'HomeAddressLine3', 'HomeAddressLine2', 'HomeAddressLine1', 'LastName', 'PreferredFirstName', 'IsEnglishAdditionalLanguage', 'ClassName', 'DateOfBirth', 'AdmissionNumber', 'DateOfLeaving', 'DietaryRequirement', 'IsFSMEver6', 'HomeAddressPostcode', 'FirstName', 'AddressBlock', 'PupilID', 'YearName', 'EnrolementStatus', 'HomeEmailAddress', 'ServiceChild', 'FirstLanguage', 'FSMStartDate', 'EntryDate', 'UPN', 'ParentSalutation', 'Mobile', 'Gender', 'PupYSSA', 'WorkEmailAddress', 'PupSenProv', 'ULN', 'Nationality', 'InCareIndicator', 'HomeLanguage', 'Religion', 'IsPupilPremium', 'MiddleName', 'House', 'FSMEndDate', 'Ethnicity', 'YearGroup', 'FSMEntitlement', 'HomePhone'
print '\nPupils found: ' + str(intCount)



	
