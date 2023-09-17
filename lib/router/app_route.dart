enum AppRoute {
  splash(
    name: 'splash',
    path: '/',
  ),
  signIn(
    name: 'signIn',
    path: 'signIn',
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
  myAccessProfile(
    name: 'myAccessProfile',
    path: 'myAccessProfile',
  ),
  myAccessChangePassword(
    name: 'myAccessChangePassword',
    path: 'myAccessChangePassword',
  ),
  myAccessChangeUserName(
    name: 'myAccessChangeUserName',
    path: 'myAccessChangeUserName',
  );

  const AppRoute({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
