enum AppRoute {
  signIn(
    name: 'signIn',
    path: '/',
  ),
  signUp(
    name: 'signUp',
    path: 'signUp',
  ),
  dashboard(
    name: 'dashboard',
    path: 'dashboard',
  ),
  personal(
    name: 'personal',
    path: 'personal',
  ),
  employment(
    name: 'employment',
    path: 'employment',
  ),
  work(
    name: 'work',
    path: 'work',
  ),
  leaves(
    name: 'leaves',
    path: 'leaves',
  ),
  leaveDetail(
    name: 'leaveDetail',
    path: 'leaveDetail',
  ),
  leavesRequest(
    name: 'leavesRequest',
    path: 'leavesRequest',
  ),
  attendance(
    name: 'attendance',
    path: 'attendance',
  ),
  attendanceDetail(
    name: 'attendanceDetail',
    path: 'attendanceDetail',
  ),
  performance(
    name: 'performance',
    path: 'performance',
  ),
  documents(
    name: 'documents',
    path: 'documents',
  ),
  handbook(
    name: 'handbook',
    path: 'handbook',
  ),
  requestUpdate(
    name: 'requestUpdate',
    path: 'requestUpdate',
  ),
  myAccess(
    name: 'myAccess',
    path: 'myAccess',
  ),
  changePassword(
    name: 'changePassword',
    path: 'changePassword',
  );

  const AppRoute({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
