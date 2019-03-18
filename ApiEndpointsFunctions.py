#!/usr/bin/python

import urllib2, json, base64, urllib

# define variable
strBaseUrl='https://xxx.xxx.xxx/api/Public/'
strDomain='XXX'

# decode base64 API token - use base64.b64encode(strToken) to encrypt the token
strEncrypted=''
strToken=base64.b64decode(strEncrypted)

def getInfo (srtEndpoint, strParameter, intId):
	request = urllib2.Request(strBaseUrl + srtEndpoint)
	request.add_header('x-schoolbase-domain', strDomain)
	request.add_header('x-schoolbase-token', strToken)
	request.get_method = lambda: 'POST'
	if (intId > 0):
		data = {strParameter: intId}
		result = urllib2.urlopen(request, urllib.urlencode(data)).read()
	else:
		result = urllib2.urlopen(request).read()
	return result

# Schoolbase API Endpoints 
strAPI = {'Endpoint': 'PupilsFurtherDetails/GetCurrentPupilComplexDetails', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsBasicDetails/GetBasicPupilDetails', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsBasicDetails/GetCurrentPupilNames', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsBasicDetails/GetCurrentLearnerContact', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsBasicDetails/GetCurrentLearnerContactWithNames', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsBasicDetails/GetPupilIdFromRollNumber', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsDayBook/GetCurrentPupilRewards', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsDayBook/GetCurrentPupilSanctions', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsExams/GetCurrentPupilExamResults', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsExams/GetCurrentPupilExamTimetable', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsFurtherDetails/GetCurrentPupilUserDetails', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsHomework/GetCurrentACYearPupilHomework', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsFurtherDetails/GetPupilPhotos', 'Parameter': 'PupOrigNums'}
#strAPI = {'Endpoint': 'PupilsSiblings/GetCurrentPupilSiblings', 'Parameter': 'PupOrigNums'}

# access Schoolbase api and collect data
objJson=json.loads(getInfo(strAPI['Endpoint'], strAPI['Parameter'], 4111))
#objJson=json.loads(getInfo(srtEndpoint, '', ''))

# Sort the JSON object
#sorted(objJson, key = lambda i: i['LastName']) 

# Pretty rpint the JSON object 
print json.dumps(objJson, sort_keys=True, indent=4, separators=(',', ': '))

#for student in objJson:
#	if student['YearGroup'] > 9 and student['YearGroup'] < 45:
#		print student['FirstName'] + ' ' + student['LastName']