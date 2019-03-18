#!/usr/bin/python

import urllib2, json, base64, urllib

# define variable
strBaseUrl='https://xxx.xxx.xxx/api/Public/'
strDomain='XXX'

# decode base64 API token - use base64.b64encode(strToken) to encrypt the token
strEncrypted=''
strToken=base64.b64decode(strEncrypted)

# please uncomment the Endpoint you would like to access and add a parameter to the ID if 0, all records will be returned.
def setEndpoint ():
	dictAPI = {'API': GetCurrentPupilComplexDetails (), 'ID': 4111}
	#dictAPI = {'API': GetBasicPupilDetails (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentPupilNames (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentLearnerContact (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentLearnerContactWithNames (), 'ID': 4111}
	#dictAPI = {'API': GetPupilIdFromRollNo (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentPupilRewards (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentPupilSanctions (), 'ID': 0}
	#dictAPI = {'API': GetCurrentPupilExamResults (), 'ID': 0}
	#dictAPI = {'API': GetCurrentPupilExamTimetable (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentPupilUserDetails (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentACYearPupilHomework (), 'ID': 4111}
	#dictAPI = {'API': GetPupilPhotos (), 'ID': 4111}
	#dictAPI = {'API': GetCurrentPupilSiblings (), 'ID': 4111}
	return dictAPI
	
def getInfo (srtEndpoint, strParameter, intId):
	print (srtEndpoint, strParameter, intId)
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

# Schoolbase API endpoints and parameters
def GetCurrentPupilComplexDetails ():
	return {'Endpoint': 'PupilsFurtherDetails/GetCurrentPupilComplexDetails', 'Parameter': 'PupOrigNums'}
def GetBasicPupilDetails ():
	return {'Endpoint': 'PupilsBasicDetails/GetBasicPupilDetails', 'Parameter': 'PupOrigNums'}
def GetCurrentPupilNames ():
	return {'Endpoint': 'PupilsBasicDetails/GetCurrentPupilNames', 'Parameter': 'PupOrigNums'}
def GetCurrentLearnerContact ():
	return {'Endpoint': 'PupilsBasicDetails/GetCurrentLearnerContact', 'Parameter': 'PupOrigNums'}
def GetCurrentLearnerContactWithNames ():
	return {'Endpoint': 'PupilsBasicDetails/GetCurrentLearnerContactWithNames', 'Parameter': 'PupOrigNums'}
def GetPupilIdFromRollNumber ():
	return {'Endpoint': 'PupilsBasicDetails/GetPupilIdFromRollNo', 'Parameter': 'PupOrigNums'}
def GetCurrentPupilRewards ():
	return {'Endpoint': 'PupilsDayBook/GetCurrentPupilRewards', 'Parameter': 'PupOrigNums'}
def GetCurrentPupilSanctions ():
	return {'Endpoint': 'PupilsDayBook/GetCurrentPupilSanctions', 'Parameter': 'PupOrigNums'}
def GetCurrentPupilExamResults ():
	return {'Endpoint': 'PupilsExam/GetCurrentPupilExamResults', 'Parameter': 'PupOrigNums'}
def GetCurrentPupilExamTimetable ():
	return {'Endpoint': 'PupilsExam/GetCurrentPupilExamTimetable', 'Parameter': 'PupOrigNums'}
def GetCurrentPupilUserDetails ():
	return {'Endpoint': 'PupilsFurtherDetails/GetCurrentPupilUserDetails', 'Parameter': 'PupOrigNums'}
def GetCurrentACYearPupilHomework ():
	return {'Endpoint': 'PupilsHomework/GetCurrentACYearPupilHomework', 'Parameter': 'PupOrigNums'}
def GetPupilPhotos ():
	return {'Endpoint': 'PupilsFurtherDetails/GetPupilPhotos', 'Parameter': 'PupOrigNums'}
def GetCurrentPupilSiblings ():
	return {'Endpoint': 'PupilsSiblings/GetCurrentPupilSiblings', 'Parameter': 'PupOrigNums'}

# set endpoint and parameters
apiInfo = setEndpoint ()
# access Schoolbase api and collect data
objJson=json.loads(getInfo (apiInfo['API']['Endpoint'], apiInfo['API']['Parameter'], apiInfo['ID'] ))

# Sort the JSON object
#sorted(objJson, key = lambda i: i['LastName']) 

# Pretty rpint the JSON object 
print json.dumps(objJson, sort_keys=True, indent=4, separators=(',', ': '))

#for student in objJson:
#	if student['YearGroup'] > 9 and student['YearGroup'] < 45:
#		print student['FirstName'] + ' ' + student['LastName']