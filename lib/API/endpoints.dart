// import 'dart:convert';

class EndPoints {
  final String userModel = '/users/';

  final String directoryURL = '/directory/?project_name=:project_name';
  final String directoryDetailURL =
      '/directory/:id/?project_name=:project_name';

  final String projectList = '/projects/';
  final String projectDetailByNameURL = '/projects/:project_name/';
  final String projectDetail = '/projects/?project_name=:project_name';
  final String projectDashboard =
      '/projects_dashboard/?project_name=:project_name';
  // final String projectCode =
  final String projectType = '/project_types/';
  final String projectPhoto = '/photos/';
  final String projectPhotos = '/:project_id/photos';

  final String documentRfiList = '/doccument/';

  final String locationURL = '/locations/?project_name=:project_name';

  final String myPendingDoc =
      '/my_documents/?project_name=:project_name&is_process=True';
  final String rfiListDraft =
      '/documents/?project_name=:project_name&state=0&process=0';
  final String rfiSearchItem =
      '/documents/?project_name=:project_name&state=0&search=:search';
  final String rfiSearchDraft =
      '/documents/?project_name=:project_name&state=0&search=:search&process=0';
  final String rfiSearchRecycle =
      '/documents/?project_name=:project_name&state=0&search=:search&process=-1';
  final String rfiListRecycleBin =
      '/documents/?project_name=:project_name&state=0&process=-1';
  final String rfiListItem = '/documents/?project_name=:project_name&state=0';
  final String rfiDetail = '/documents/:id/?state=0&project_name=:project_name';
  final String documentRfi = '/documents/?project_name=:project_name&state=0';
  final String docDetail = '/documents/:id/?project_name=:project_name';
  

  final String dynamicSearchItem =
      '/document_plans/?project_name=:project_name&search=:search';
  final String dynamicSearchDraft =
      '/document_plans/?project_name=:project_name&search=:search&process=0';
      final String dynamicSearchRecycle =
      '/document_plans/?project_name=:project_name&search=:search&process=-1';
  final String dynamicPlanListItem =
      '/document_plans/?project_name=:project_name';
  final String dynamicPlanListDraft =
      '/document_plans/?project_name=:project_name&process=0';
  final String dynamicPlanListRecycleBin =
      '/document_plans/?project_name=:project_name&process=-1';
  final String dynamicPlanDetail =
      '/document_plans/:id/?project_name=:project_name';

  final String submittalListItem =
      '/documents/?project_name=:project_name&state=1';
      final String submittalSearchItem =
      '/documents/?project_name=:project_name&state=1&search=:search';
  final String submittalSearchLatest =
      '/documents/?project_name=:project_name&state=1&search=:search&is_last=True';
  final String submittalSearchDarft =
      '/documents/?project_name=:project_name&state=1&search=:search&process=0';
  final String submittalSearchRecycle =
      '/documents/?project_name=:project_name&state=1&search=:search&process=-1';
  final String submittalListDraft =
      '/documents/?project_name=:project_name&state=1&process=0';
  final String submittalListLatestItems =
      '/documents/?project_name=:project_name&state=1&is_last=True';
  final String submittalListRecycleBin =
      '/documents/?project_name=:project_name&state=1&process=-1';
  final String docDetailSummittal =
      '/documents/?project_name=:project_name&state=1';
  final String submittalsDetail =
      '/documents/:id/?state=1&project_name=:project_name';

  final String documentList = '/files/?project_name=:project_name';
  final String documentDetail = '/files/:id/?project_name=:project_name';

  final String locationList = '/locations/?project_name=:project_name';

  final String dashBoard = '/projects_dashboard/?project_name=:project_name';

  final String docfile = '/document_files/?project_name=:project_name';
  final String docfiledetail =
      '/document_files/:id/?project_name=:project_name';
  final String fileStatic = '/static-file/';
}
