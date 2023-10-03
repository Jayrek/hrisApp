class AccountDetailsResponse {
  AccountDetailsResponse({
    this.id,
    this.employeeId,
    this.employeeRefid,
    this.username,
    this.password,
    this.lastAccess,
    this.status,
    this.attempts,
    this.groupAccess,
    this.regstatus,
    this.token,
    this.tokenExpiration,
  });

  AccountDetailsResponse.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeRefid = json['employee_refid'];
    username = json['username'];
    password = json['password'];
    lastAccess = json['last_access'];
    status = json['status'];
    attempts = json['attempts'];
    groupAccess = json['group_access'];
    regstatus = json['regstatus'];
    token = json['token'];
    tokenExpiration = json['token_expiration'];
  }

  int? id;
  int? employeeId;
  String? employeeRefid;
  String? username;
  String? password;
  String? lastAccess;
  String? status;
  int? attempts;
  String? groupAccess;
  String? regstatus;
  String? token;
  String? tokenExpiration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_id'] = employeeId;
    map['employee_refid'] = employeeRefid;
    map['username'] = username;
    map['password'] = password;
    map['last_access'] = lastAccess;
    map['status'] = status;
    map['attempts'] = attempts;
    map['group_access'] = groupAccess;
    map['regstatus'] = regstatus;
    map['token'] = token;
    map['token_expiration'] = tokenExpiration;
    return map;
  }

  @override
  String toString() {
    return 'AccountDetailsResponse{id: $id, employeeId: $employeeId, employeeRefid: $employeeRefid, username: $username, password: $password, lastAccess: $lastAccess, status: $status, attempts: $attempts, groupAccess: $groupAccess, regstatus: $regstatus, token: $token, tokenExpiration: $tokenExpiration}';
  }
}
