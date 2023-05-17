import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final ConnectivityBloc connectivityBloc = ConnectivityBloc();
  switch (settings.name) {
    //   case MyRoute.loginViewRoute:
    //     var loginServer = (settings.arguments
    //         as Map<dynamic, dynamic>?)?[KeyParams.loginServer];
    //     final isLogout =
    //         (settings.arguments as Map<dynamic, dynamic>?)?[KeyParams.isLogout];

    //     String serverMode = "";

    //     loginServer == null
    //         ? serverMode = ServerMode.prod.toString()
    //         : serverMode = loginServer;

    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => LoginBloc()
    //           ..add(LoginViewLoaded(
    //               defaultServerMode: serverMode, isLogOut: isLogout ?? false)),
    //         // child: const LoginViewOld(),
    //         child: const LoginViewNew(),
    //         // child: const LoginView(),
    //       ),
    //     );
    //   case MyRoute.homePageRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => HomeBloc()..add(HomeViewLoaded()),
    //         child: const HomeView(),
    //       ),
    //     );
    //   case MyRoute.clockInOutRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => ClockInOutBloc()..add(ClockInOutViewLoaded()),
    //         // child: const ClockInOutView(),
    //         child: const ClockInOutView2(),
    //       ),
    //     );
    //   case MyRoute.historyInOutRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             HistoryInOutBloc()..add(HistoryInOutViewLoaded()),
    //         child: const HistoryInOutView(),
    //       ),
    //     );
    //   case MyRoute.timesheetsRoute:
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) =>
    //                   TimesheetsBloc()..add(const TimesheetsViewLoaded()),
    //               child: const TimesheetsView(),
    //             ));
    //   case MyRoute.timesheetsDetailRoute:
    //     final timesheets = (settings.arguments as Map)[KeyParams.timesheets];
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) => TimesheetsDetailBloc()
    //                 ..add(TimesheetsDetailViewLoaded(
    //                   timesheetsItem: timesheets,
    //                 )),
    //               child: TimesheetsDetailView(timesheetsResponse: timesheets),
    //             ));

    //   case MyRoute.announcementRoute:
    //     final AnnouncementsResponse announcementsPayload =
    //         (settings.arguments as Map)[KeyParams.announcements];
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => AnnouncementsBloc()
    //           ..add(AnnouncementsLoaded(
    //               announcementsPayload: announcementsPayload)),
    //         child: const AnnouncementDetailView(),
    //       ),
    //     );
    //   case MyRoute.employeeRoute:
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) =>
    //                   EmployeeBloc()..add(EmployeeSearchViewLoaded()),
    //               child: const EmployeeView(),
    //             ));
    //   case MyRoute.employeeDetailRoute:
    //     final EmployeeSearchResponse employee =
    //         (settings.arguments as Map)[KeyParams.employee];
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) => EmployeeDetailBloc()
    //                 ..add(EmployeeDetailViewLoaded(
    //                     idEmp: employee.employeeId ?? 0)),
    //               child: EmployeeDetailView(
    //                 employee: employee,
    //               ),
    //             ));
    //   case MyRoute.bookingMeetingRoute:
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) => BookingMeetingBloc()
    //                 ..add(BookingMeetingViewLoaded(date: DateTime.now())),
    //               child: const BookingMeetingView(),
    //             ));
    //   case MyRoute.addBookingMeetingRoute:
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) =>
    //                   AddBookingMeetingBloc()..add(AddBookingMeetingViewLoaded()),
    //               child: const AddBookingMeetingView(),
    //             ));
    //   // case MyRoute.proFileRoute:
    //   // return

    //   case MyRoute.proFileRoute:
    //     int type = (settings.arguments as Map)[KeyParams.uploadImg];

    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             ProfileBloc()..add(ProfileViewLoaded(typeUpdate: type)),
    //         child: const ProfileView(),
    //       ),
    //     );

    //   case MyRoute.serviceRequestRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             ServiceRequestBloc()..add(ServiceRequestViewLoaded()),
    //         child: const ServiceRequestView(),
    //       ),
    //     );
    //   case MyRoute.addServiceRequestRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             AddServiceRequestBloc()..add(AddServiceRequestViewLoaded()),
    //         child: const AddServiceRequestView(),
    //       ),
    //     );
    //   case MyRoute.serviceRequestDetailRoute:
    //     String svrNo = (settings.arguments as Map)[KeyParams.svrNo];
    //     final isApprove = (settings.arguments as Map)[KeyParams.isApproveSVR];

    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) => ServiceRequestDetailBloc()
    //                 ..add(ServiceRequestDetailViewLoaded(svrNo: svrNo)),
    //               child: ServiceRequestDetailView(
    //                 svrNo: svrNo,
    //                 isApprove: isApprove,
    //               ),
    //             ));
    //   case MyRoute.leaveRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => LeaveBloc()..add(const LeaveLoaded()),
    //         child: const LeaveView(),
    //       ),
    //     );

    //   case MyRoute.leaveDetailRoute:
    //     final lvNo = (settings.arguments as Map)[KeyParams.lvNoLeave];
    //     final isApprove = (settings.arguments as Map)[KeyParams.isApproveLeave];
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) =>
    //                   LeaveDetailBloc()..add(LeaveDetailLoaded(lvNo: lvNo)),
    //               child: LeaveDetailView(
    //                 isApprove: isApprove,
    //               ),
    //             ));
    //   case MyRoute.newLeave:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => NewLeaveBloc()..add(NewLeaveLoaded()),
    //         child: const NewLeaveView(),
    //       ),
    //     );
    //   case MyRoute.displayFileRoute:
    //     final fileList = (settings.arguments as Map)[KeyParams.fileList];

    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             DisplayFileBloc()..add(DisplayFileViewLoaded(fileList: fileList)),
    //         child: const DisplayFileView(),
    //       ),
    //     );

    //   case MyRoute.itServiceRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => ITServiceBloc()..add(const ITServiceLoaded()),
    //         child: const ITServiceView(),
    //       ),
    //     );
    //   case MyRoute.itServiceDetailRoute:
    //     final irsNo = (settings.arguments as Map)[KeyParams.irsNo];

    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             ITServiceDetailBloc()..add(ITServiceDetailLoaded(irsNo: irsNo)),
    //         child: const ITServiceDetailView(),
    //       ),
    //     );
    //   case MyRoute.itServiceNewRequestRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             ITServiceNewRequestBloc()..add(ITServiceNewRequestLoaded()),
    //         child: const CreateNewITServiceView(),
    //       ),
    //     );
    //   case MyRoute.serviceApprovalRoute:
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) => ServiceApprovalBloc()
    //                 ..add(const ServiceApprovalViewLoaded()),
    //               child: const ServiceApprovalView(),
    //             ));
    //   case MyRoute.leaveApprovalRoute:
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) =>
    //                   LeaveApprovalBloc()..add(const LeaveApprovalViewLoaded()),
    //               child: const LeaveApprovalView(),
    //             ));

    //   case MyRoute.interviewApprovalRoute:
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) =>
    //             InterviewApprovalBloc()..add(InterviewApprovalLoaded()),
    //         child: const InterviewApprovalView(),
    //       ),
    //     );
    //   case MyRoute.interviewApprovalDetailRoute:
    //     InterviewApprovalResponse item =
    //         (settings.arguments as Map)[KeyParams.interviewDetail];
    //     return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => InterviewApprovalDetailBloc()
    //           ..add(
    //               InterviewApprovalDetailLoaded(interviewApprovalResponse: item)),
    //         child: const InterviewApprovalViewDetail(),
    //       ),
    //     );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No path ${settings.name}')),
        ),
      );
  }
}
