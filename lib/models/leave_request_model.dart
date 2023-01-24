class LeaveRequest {
   late final int? id;
  final String? leaveType;
  final String? startDate;
  final String? endDate;
  final String? leaveDay;
  final String? deptHead;
  final String? yourReason;

  LeaveRequest({
     required this.id,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.leaveDay,
    required this.deptHead,
    required this.yourReason,
  });
}
//List<LeaveRequest> lrequest = <LeaveRequest>[
// final List<LeaveRequest> lrequest = [
//   LeaveRequest(
//     id: 1,
//     leaveType: 'Casual Leave',
//     startDate:
//     '11-02-2023',
//     endDate: '14-02-2023',
//     leaveDay: 'Full day',
//     deptHead: 'Ward',
//     yourReason: 'bnbvnb',
//   ),
//   LeaveRequest(
//     id: 2,
//     leaveType: 'Casual Leave',
//     startDate:
//     '21-02-2023',
//     endDate: '14-03-2023',
//     leaveDay: 'Half day',
//     deptHead: 'Icu care',
//     yourReason: '4cvbb',
//   ),
//   LeaveRequest(
//     id: 3,
//     leaveType: 'Sick Leave',
//     startDate:
//     '15-02-2023',
//     endDate: '24-02-2023',
//     leaveDay: 'Full day',
//     deptHead: 'Ward',
//     yourReason: 'cbhfghg4',
//   ),
//];
