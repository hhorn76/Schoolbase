#########################################################################################
#                             Written by Heiko Horn 2019                                #
#########################################################################################

### Schoolbase Service Credential ###
$strBaseUrl = 'https://xxx.xxx.xxx/api/Public/'
$strDomain = 'XXX'

# Store a Base64 encoded string in your Registry using the following command: $strEncoded = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes('MyPassword'))
# Get the encoded string from the registry
$strRegKey = 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\SchoolbaseAPI'
$strReg = Get-ItemProperty -Path "Registry::$strRegKey"
# Decode the sting 
$sbToken = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String(($strReg).apiToken))

### Functions
## Please uncomment the Endpoint you would like to access and add a parameter to the ID if 0, all records will be returned.
Function SetEndpoint {
    #$dictAPI=@{API=GetCurrentPupilComplexDetails; ID=4111}
    #$dictAPI=@{API=GetActivitiesBasicDetailsList; ID=22433}
    #$dictAPI=@{API=GetEventDetailsList; ID=6545}
    #$dictAPI=@{API=GetCurrentAdultContactDetails; ID=0}
    #$dictAPI=@{API=GetPerAdultContactDetails; ID=0}
    #$dictAPI=@{API=GetBusRouteDetails; ID=0}
    #$dictAPI=@{API=GetCoachDetails; ID=0}
    #$dictAPI=@{API=GetPupilBusDetails; ID=0}
    #$dictAPI=@{API=GetClassDetails; ID=0}
    #$dictAPI=@{API=GetSubjectTitleAndCode; ID=480}
    #$dictAPI=@{API=GetClockInOutByDateDetails; ID=0}
    #$dictAPI=@{API=GetClockInOutDetails; ID=0}
    #$dictAPI=@{API=GetDocumentTypes; ID=0}
    #$dictAPI=@{API=GetDocument 1; ID=0}
    #$dictAPI=@{API=GetPupilDocuments 1; ID=0}
    #$dictAPI=@{API=GetParentDocuments 1; ID=0}
    #$dictAPI=@{API=GetCurentGroupDetails; ID=0}
    #$dictAPI=@{API=GetBorrowedBookDetails; ID=0}
    #$dictAPI=@{API=GetCurrentAcadRecGroup; ID=0}
    #$dictAPI=@{API=GetCurrentGroupLearnerDetails; ID=0}
    #$dictAPI=@{API=GetCurrentGroupPupilDetails; ID=0}
    #$dictAPI=@{API=GetCurrentPupilClassHouseDetails; ID=0}
    #$dictAPI=@{API=GetPupilAbsenceDetails; ID=0}
    #$dictAPI=@{API=GetCurrentPupilClassHouseDetails; ID=0}
    $dictAPI=@{API=GetBasicPupilDetails; ID=4111}
    #$dictAPI=@{API=GetCurrentPupilNames; ID=0}
    #$dictAPI=@{API=GetCurrentLearnerContact; ID=0}
    #$dictAPI=@{API=GetCurrentLearnerContactWithNames; ID=0}
    #$dictAPI=@{API=GetPupilIdFromRollNumber; ID=0}
    #$dictAPI=@{API=GetCurrentPupilComplexDetails; ID=4111}
    #$dictAPI=@{API=GetLeaverPupilComplexDetails; ID=0}
    #$dictAPI=@{API=GetMiscellaneousPupilDetails; ID=0}
    #$dictAPI=@{API=GetProspectivePupilDetails; ID=0}
    #$dictAPI=@{API=GetPupilAdultFurtherDetails; ID=0}
    #$dictAPI=@{API=GetCurrentPupilRewards; ID=0}
    #$dictAPI=@{API=GetCurrentPupilSanctions; ID=0}
    #$dictAPI=@{API=GetCurrentPupilExamResults; ID=0}
    #$dictAPI=@{API=GetCurrentPupilExamTimetable; ID=0}
    #$dictAPI=@{API=GetCurrentPupilUserDetails; ID=0}
    #$dictAPI=@{API=GetCurrentACYearPupilHomework; ID=0}
    #$dictAPI=@{API=GetCurrentPupilAllergies; ID=0}
    #$dictAPI=@{API=GetCurrentPupilMedicalConditions; ID=0}
    #$dictAPI=@{API=GetCurrentPupilVaccinationDetails; ID=0}
    #$dictAPI=@{API=GetPupilPhotos; ID=4111}
    #$dictAPI=@{API=GetCurrentPupilSiblings; ID=0}
    return $dictAPI
}
### Function to connect to Schoolbase API
Function getInfo ($srtEndpoint, $strParameter, $intID) {
    $sbUri="$($strBaseUrl)$($srtEndpoint)"
    if ($intID -gt 0) {
        Write-Host "Connecting to Schoolbase API with body parameters" -ForegroundColor Yellow
        Invoke-RestMethod -Uri $sbUri -Headers @{"x-schoolbase-domain"=$strDomain; "x-schoolbase-token"=$sbToken} -Body @{"$strParameter"="$intID"} -Method Post
    } else {
        Write-Host "Connecting to Schoolbase API" -ForegroundColor Yellow
        Invoke-RestMethod -Uri $sbUri -Headers @{"x-schoolbase-domain"=$strDomain; "x-schoolbase-token"=$sbToken} -Method Post
    }
    Clear-Variable strParameter,intID, sbUri
}
### Activities Basic Information Permission Endpoint (Read)
Function GetActivitiesBasicDetailsList {
    $srtEP='Activities/GetActivitiesBasicDetailsList'
    $strPar='groupID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetEventDetailsList {
    $srtEP='Activities/GetEventDetailsList'
    $strPar='EventID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Adult Contact Information Permission Endpoint (Read)
Function GetCurrentAdultContactDetails {
    $srtEP='AdultContact/GetCurrentAdultContactDetails'
    $strPar='AdultContactDetails'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetPerAdultContactDetails {
    $srtEP='AdultContact/GetPerAdultContactDetails'
    $strPar='AdultContactDetails'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Bus Information Permission Endpoint (Read)
Function GetBusRouteDetails {
    $srtEP='Bus/GetBusRouteDetails'
    $strPar='BusRouteId'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCoachDetails {
    $srtEP='Bus/GetCoachDetails'
    $strPar=''
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetPupilBusDetails {
    $srtEP='Bus/GetPupilBusDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Class Basic Information Permission Endpoint (Read)
Function GetClassDetails {
    $srtEP='Class/GetClassDetails'
    $strPar='ClassId'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetSubjectTitleAndCode {
    $srtEP='Class/GetSubjectTitleAndCode'
    $strPar='SubjectID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Clock In Out Information Permission Endpoint (Read)
Function GetClockInOutByDateDetails {
    $srtEP='ClockInOut/GetClockInOutByDateDetails'
    $strPar='UserID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetClockInOutDetails {
    $srtEP='ClockInOut/GetClockInOutDetails'
    $strPar='Date'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
#Documents – Parent Permission Endpoint (Read)
Function GetDocumentTypes {
    $srtEP='Documents/DocumentTypes'
    $strPar='UserID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetDocument ($intID) {
    $srtEP="Documents/Document/$intID"
    $strPar='id'
    return @{Endpoint=$srtEP; ID=$intID; Parameter=$strPar}
}
Function GetPupilDocuments ($intID) {
    $srtEP="Documents/PupilDocuments/$intID"
    $strPar='types'
    return @{Endpoint=$srtEP; ID=$intID; Parameter=$strPar}
}
Function GetParentDocuments ($intID) {
    $srtEP="Documents/PupilDocuments/$intID"
    $strPar='types'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Group Basic Information Permission Endpoint (Read)
Function GetCurentGroupDetails {
    $srtEP='Group/GetCurentGroupDetails'
    $strPar='GroupId'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Group Book Information Permission Endpoint (Read)
Function GetBorrowedBookDetails {
    $srtEP='Group/GetBorrowedBookDetails'
    $strPar='GroupId'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Group Learner Information Permission Endpoint (Read)
Function GetCurrentAcadRecGroup {
    $srtEP='GroupLearner/GetCurrentAcadRecGroup'
    $strPar='GroupId'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentGroupLearnerDetails {
    $srtEP='GroupLearner/GetCurrentGroupLearnerDetails'
    $strPar='GroupId'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentGroupPupilDetails {
    $srtEP='GroupLearner/GetCurrentGroupPupilDetails'
    $strPar='GroupId'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentPupilClassHouseDetails {
    $srtEP='GroupLearner/GetCurrentPupilClassHouseDetails'
    $strPar='pupilID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Absence Information Permission Endpoint (Read)
Function GetPupilAbsenceDetails {
    $srtEP='Absence/GetPupilAbsenceDetails'
    $strPar='pupilID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentPupilClassHouseDetails {
    $srtEP='Absence/GetPupilAttendanceDetails'
    $strPar='pupilID'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Basic Information Permission Endpoint (Read)
Function GetBasicPupilDetails {
    $srtEP='PupilsBasicDetails/GetBasicPupilDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentPupilNames {
    $srtEP='PupilsBasicDetails/GetCurrentPupilNames'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentLearnerContact {
    $srtEP='PupilsBasicDetails/GetCurrentLearnerContact'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentLearnerContactWithNames {
    $srtEP='PupilsBasicDetails/GetCurrentLearnerContactWithNames'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetPupilIdFromRollNumber {
    $srtEP='PupilsBasicDetails/GetPupilIdFromRollNumber'
    $strPar='CompNo'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Complex Information Permission Endpoint (Read)
Function GetCurrentPupilComplexDetails {
    $srtEP='PupilsFurtherDetails/GetCurrentPupilComplexDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetLeaverPupilComplexDetails {
    $srtEP='PupilsFurtherDetails/GetLeaverPupilComplexDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetMiscellaneousPupilDetails {
    $srtEP='PupilsFurtherDetails/GetMiscellaneousPupilDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetProspectivePupilDetails {
    $srtEP='PupilsFurtherDetails/GetProspectivePupilDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetPupilAdultFurtherDetails {
    $srtEP='PupilsFurtherDetails/GetPupilAdultFurtherDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Day Book Permission Endpoint (Read)
Function GetCurrentPupilRewards {
    $srtEP='PupilsDayBook/GetCurrentPupilRewards'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentPupilSanctions {
    $srtEP='PupilsDayBook/GetCurrentPupilSanctions'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Exams Permission Endpoint (Read)
Function GetCurrentPupilExamResults {
    $srtEP='PupilsExams/GetCurrentPupilExamResults'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentPupilExamTimetable {
    $srtEP='PupilsExams/GetCurrentPupilExamTimetable'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Further Information Permission Endpoint (Read)
Function GetCurrentPupilUserDetails {
    $srtEP='PupilsFurtherDetails/GetCurrentPupilUserDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Homework Permission Endpoint (Read)
Function GetCurrentACYearPupilHomework {
    $srtEP='PupilsHomework/GetCurrentACYearPupilHomework'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Medical Information Permission Endpoint (Read)
Function GetCurrentPupilAllergies {
    $srtEP='PupilsMedical/GetCurrentPupilAllergies'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentPupilMedicalConditions {
    $srtEP='PupilsMedical/GetCurrentPupilMedicalConditions'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
Function GetCurrentPupilVaccinationDetails {
    $srtEP='PupilsMedical/GetCurrentPupilVaccinationDetails'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Photograph Permission Endpoint (Read)
Function GetPupilPhotos {
    $srtEP='PupilsFurtherDetails/GetPupilPhotos'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}
### Pupil Sibling Information Permission Endpoint (Read)
Function GetCurrentPupilSiblings {
    $srtEP='PupilsSiblings/GetCurrentPupilSiblings'
    $strPar='PupOrigNums'
    return @{Endpoint=$srtEP; Parameter=$strPar}
}

$dictEP=SetEndpoint
getInfo $dictEP.API.Endpoint $dictEP.API.Parameter $dictEP.ID
Clear-Variable dictEP

######################
### API Endpoints
#####################

### Activities Basic Information Permission Endpoint (Read)
#Endpoint: 'Activities/GetActivitiesBasicDetailsList'
#Parameter: 'groupID'
#Endpoint: 'Activities/GetEventDetailsList'
#Parameter: 'EventID'

### Adult Contact Information Permission Endpoint (Read)
#Endpoint: 'AdultContact/GetCurrentAdultContactDetails'
#Parameter: 'AdultContactDetails'
#Endpoint: 'AdultContact/GetPerAdultContactDetails'
#Parameter: 'AdultContactDetails'

### Bus Information Permission Endpoint (Read)
#Endpoint: 'Bus/GetBusRouteDetails'
#Parameter: BusRouteId
#Endpoint: 'Bus/GetCoachDetails'
#Endpoint: 'Bus/GetPupilBusDetails'
#Parameter: PupOrigNums

### Class Basic Information Permission Endpoint (Read)
#Endpoint: 'Class/GetClassDetails'
#Parameter: ClassId
#Endpoint: 'Class/GetSubjectTitleAndCode'
#Parameter: SubjectId

### Clock In Out Information Permission Endpoint (Read)
#Endpoint: 'ClockInOut/GetClockInOutByDateDetails'
#Parameter: UserID
#Endpoint: 'ClockInOut/GetClockInOutDetails'
#Parameter: Date

### Clock In Out Permission Endpoint (Create)
#Endpoint: 'ClockInOut/ClockInOut'
#Parameter: staffIdent
#Parameter: cardNumber
#Parameter: timestamp
#Parameter: isClickIn

#Documents – Parent Permission Endpoint (Read)
#Endpoint: 'Documents/DocumentTypes'
#Parameter: NONE
#Endpoint: 'Documents/Document/{id}'
#Parameter: id
#Endpoint: 'Documents/PupilDocuments/{id}
#Parameter: types
#Endpoint: 'Documents/ParentDocuments'
#Parameter: types

### Group Basic Information Permission Endpoint (Read)
#Endpoint: 'Group/GetCurentGroupDetails'
#Parameter: GroupId

### Group Book Information Permission Endpoint (Read)
#Endpoint: 'Group/GetBorrowedBookDetails'
#Parameter: GroupId

### Group Learner Information Permission Endpoint (Read)
#Endpoint: 'GroupLearner/GetCurrentAcadRecGroup'
#Parameter: groupID
#Endpoint: 'GroupLearner/GetCurrentGroupLearnerDetails'
#Parameter: groupID
#Endpoint: 'GroupLearner/GetCurrentGroupPupilDetails'
#Parameter: groupID
#Endpoint: 'GroupLearner/GetCurrentPupilClassHouseDetails'
#Parameter: pupilID

### Pupil Absence Information Permission Endpoint (Read)
#Endpoint: 'Absence/GetPupilAbsenceDetails'
#Parameter: pupilID
#Endpoint: 'Absence/GetPupilAttendanceDetails'
#Parameter: pupilID

### Pupil Basic Information Permission Endpoint (Read)
#Endpoint: 'PupilsBasicDetails/GetBasicPupilDetails'
#Parameter: PupOrigNums
#Endpoint: 'PupilsBasicDetails/GetCurrentPupilNames'
#Parameter: PupOrigNums
#Endpoint: 'PupilsBasicDetails/GetCurrentLearnerContact'
#Parameter: PupOrigNums
#Endpoint: 'PupilsBasicDetails/GetCurrentLearnerContactWithNames'
#Parameter: PupOrigNums
#Endpoint: 'PupilsBasicDetails/GetPupilIdFromRollNumber'
#Parameter: CompNo

### Pupil Complex Information Permission Endpoint (Read)
#Endpoint: 'PupilsFurtherDetails/GetCurrentPupilComplexDetails'
#Parameter: 'PupOrigNums'
#Endpoint: 'PupilsFurtherDetails/GetLeaverPupilComplexDetails'
#Parameter: 'PupOrigNums'
#Endpoint: 'PupilsFurtherDetails/GetMiscellaneousPupilDetails'
#Parameter: 'PupOrigNums'
#Endpoint: 'PupilsFurtherDetails/GetProspectivePupilDetails'
#Parameter: 'PupOrigNums'
#Endpoint: 'PupilsFurtherDetails/GetPupilAdultFurtherDetails'
#Parameter: 'PupOrigNums'

### Pupil Day Book Permission Endpoint (Read)
#Endpoint: 'PupilsDayBook/GetCurrentPupilRewards'
#Parameter: PupOrigNums
#Endpoint: 'PupilsDayBook/GetCurrentPupilSanctions'
#Parameter: PupOrigNums

### Pupil Exams Permission Endpoint (Read)
#Endpoint: 'PupilsExams/GetCurrentPupilExamResults'
#Parameter: PupOrigNums
#Endpoint: 'PupilsExams/GetCurrentPupilExamTimetable'
#Parameter: PupOrigNums

### Pupil Further Information Permission Endpoint (Read)
#Endpoint: 'PupilsFurtherDetails/GetCurrentPupilUserDetails'
#Parameter: 'PupOrigNums'

### Pupil Homework Permission Endpoint (Read)
#Endpoint: 'PupilsHomework/GetCurrentACYearPupilHomework'
#Parameter: 'PupOrigNums'

### Pupil Medical Information Permission Endpoint (Read)
#Endpoint: 'PupilsMedical/GetCurrentPupilAllergies'
#Parameter: 'PupOrigNums'
#Endpoint: 'PupilsMedical/GetCurrentPupilMedicalConditions'
#Parameter: 'PupOrigNums'
#Endpoint: 'PupilsMedical/GetCurrentPupilVaccinationDetails'
#Parameter: 'PupOrigNums'

### Pupil Photograph Permission Endpoint (Read)
#Endpoint: 'PupilsFurtherDetails/GetPupilPhotos'
#Parameter: 'PupOrigNums'

### Pupil Sibling Information Permission Endpoint (Read)
#Endpoint: 'PupilsSiblings/GetCurrentPupilSiblings'
#Parameter: 'PupOrigNums'

### School Basic Information Permission Endpoint (Read)
#Endpoint: 'School/GetAcadYearStart'
#Endpoint: 'School/GetRoomDetails'
#Endpoint: 'School/GetTermDates'

### School Fault Information Permission Endpoint (Read)
#Endpoint: 'School/GetFaultDetails'

### School Feeder Information Permission Endpoint (Read)
#Endpoint: 'School/GetFeederDetails'

### Staff Contact Information Permission Endpoint (Read)
#Endpoint: 'StaffContact/GetStaffContactDetails'

### Staff Information Permission Endpoint (Read)
#Endpoint: 'StaffDetails/GetStaffDetails'
#Endpoint: 'StaffDetails/GetTeacherBasicDetails'

### Staff Photgraph Permission Endpoint (Read)
#Endpoint: 'StaffDetails/GetStaffPhotos'

### Timetable Information Permission Endpoint (Read)
#Endpoint: 'Day/GetDayBasicInfo'
#Endpoint: 'TimetablePeriod/GetTimetableDetails'
#Endpoint: 'TimetablePeriod/GetTimetableExtendedDetails'
#Endpoint: 'TimetablePeriod/GetTimetableFullDetails'
#Endpoint: 'TimetablePeriod/GetTimetablePupilDetails'
#Endpoint: 'TimetablePeriod/GetTimetableRoomDetails'
#Endpoint: 'TimetablePeriod/GetTimetableRoomDetails'
#Endpoint: 'TimetablePeriod/GetTimetableStaffDetails'

### Pupil Day Book Permission Endpoint (Read)
#$srtEndpoint='PupilsDayBook/GetCurrentPupilRewards'
#$srtEndpoint='PupilsDayBook/GetCurrentPupilSanctions'

### Pupil Exams Permission Endpoint (Read)
#$srtEndpoint='PupilsExams/GetCurrentPupilExamResults'
#$srtEndpoint='PupilsExams/GetCurrentPupilExamTimetable'

### Pupil Further Information Permission Endpoint (Read)
#$srtEndpoint='PupilsFurtherDetails/GetCurrentPupilUserDetails'
#$strParameter='PupOrigNums'
#$intID=4111

### Pupil Homework Permission Endpoint (Read)
#$srtEndpoint='PupilsHomework/GetCurrentACYearPupilHomework'

### Pupil Medical Information Permission Endpoint (Read)
#$srtEndpoint='PupilsMedical/GetCurrentPupilAllergies'
#$srtEndpoint='PupilsMedical/GetCurrentPupilMedicalConditions'
#$srtEndpoint='PupilsMedical/GetCurrentPupilVaccinationDetails'

### Pupil Photograph Permission Endpoint (Read)
#$srtEndpoint='PupilsFurtherDetails/GetPupilPhotos'

### Pupil Sibling Information Permission Endpoint (Read)
#$srtEndpoint='PupilsSiblings/GetCurrentPupilSiblings'

### School Basic Information Permission Endpoint (Read)
#$srtEndpoint='School/GetAcadYearStart'
#$srtEndpoint='School/GetRoomDetails'
#$srtEndpoint='School/GetTermDates'

### School Fault Information Permission Endpoint (Read)
#$srtEndpoint='School/GetFaultDetails'

### School Feeder Information Permission Endpoint (Read)
#$srtEndpoint='School/GetFeederDetails'

### Staff Contact Information Permission Endpoint (Read)
#$srtEndpoint='StaffContact/GetStaffContactDetails'

### Staff Information Permission Endpoint (Read)
#$srtEndpoint='StaffDetails/GetStaffDetails'
#$srtEndpoint='StaffDetails/GetTeacherBasicDetails'

### Staff Photgraph Permission Endpoint (Read)
#$srtEndpoint='StaffDetails/GetStaffPhotos'

### Timetable Information Permission Endpoint (Read)
#$srtEndpoint='Day/GetDayBasicInfo'
#$srtEndpoint='TimetablePeriod/GetTimetableDetails'
#$srtEndpoint='TimetablePeriod/GetTimetableExtendedDetails'
#$srtEndpoint='TimetablePeriod/GetTimetableFullDetails'
#$srtEndpoint='TimetablePeriod/GetTimetablePupilDetails'
#$srtEndpoint='TimetablePeriod/GetTimetableRoomDetails'
#$srtEndpoint='TimetablePeriod/GetTimetableRoomDetails'
#$srtEndpoint='TimetablePeriod/GetTimetableStaffDetails'
