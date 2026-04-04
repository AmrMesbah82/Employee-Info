========================================================
        FLUTTER TECHNICAL INTERVIEW TASK
        Employee Profile Screen
========================================================


OBJECTIVE
---------
Build an Employee Profile Screen that displays detailed employee information
fetched from Firebase Firestore.

The screen shows a company employee's personal info, position details,
working hours, and general information (education, skills, hobbies).

You are provided with:
- A static UI reference file (employee_detailed_info_static.dart) -- use it as a visual guide only.
- An employee model file (employee_model.dart) -- you MUST use this model.


========================================================
SCREEN LAYOUT
========================================================

The screen is split into two panels (tablet/desktop layout):

+------------------+-------------------------------------+
|  Organization Chart  >  Employee Info                  |
+------------------+-------------------------------------+
|                  |                                     |
|   [Avatar]       |  Position Details                   |
|                  |  Department    | Value              |
|  Ahmed Mohamed   |  Supervisor    | Value              |
|  Sr. Developer   |  Email         | Value              |
|                  |  Phone         | Value              |
|  Bio text...     |  Title         | Value              |
|                  |                                     |
|                  |  Working Hours                      |
|                  |  Start Date    | Value              |
|                  |  Working Hours | Value              |
|                  |  Days Off      | Value              |
|                  |  Job Location  | Value              |
|                  |                                     |
|  [Chat Button]   |  General Information               |
|                  |  Institution   | Value              |
|                  |  Degree        | Value              |
|                  |  Grad. Year    | Value              |
|                  |  Skills        | Value              |
|                  |  Hobbies       | Value              |
+------------------+-------------------------------------+


========================================================
FIREBASE FIRESTORE STRUCTURE
========================================================

Collection: employees

{
  "first_name": "Ahmed",
  "last_name": "Mohamed",
  "email": "ahmed.mohamed@company.com",
  "phone": "+20 1012345678",
  "photo_url": "https://firebasestorage.googleapis.com/...",
  "job_title": "Senior Flutter Developer",
  "bio": "Experienced mobile developer with 5+ years...",
  "position_details": {
    "department": "Technology & Development",
    "supervisor": "Mohamed Ali",
    "title": "Senior Developer"
  },
  "working_hours": {
    "start_date": "Jan 15, 2021",
    "hours": "9:00 AM - 5:00 PM",
    "days_off": ["Friday", "Saturday"],
    "job_location": "Cairo, Egypt"
  },
  "academic_info": {
    "institution_name": "Cairo University",
    "degree": "Bachelor's Degree",
    "graduation_year": "2018"
  },
  "skills": [
    {"name": "Flutter", "level": "Expert"},
    {"name": "Dart", "level": "Expert"},
    {"name": "Firebase", "level": "Advanced"},
    {"name": "REST APIs", "level": "Advanced"}
  ],
  "hobbies": ["Reading", "Football", "Travelling"]
}


========================================================
REQUIREMENTS
========================================================


1. ARCHITECTURE (Must Apply)
-----------------------------
You MUST follow Clean Architecture with Cubit:

lib/
  main.dart
  
  features/
    employee_profile/
    
      data/
        models/
          employee_model.dart              <-- Provided (use as-is)
        data_sources/
          employee_remote_data_source.dart
        repositories/
          employee_repository_impl.dart
      
      domain/
        repositories/
          employee_repository.dart         <-- Abstract repo
      
      presentation/
        cubit/
          employee_profile_cubit.dart
          employee_profile_state.dart
        pages/
          employee_profile_page.dart
        widgets/
          employee_info_card.dart           <-- Left panel
          employee_work_info_card.dart      <-- Right panel
          info_section.dart                 <-- Reusable section
  
  core/
    widgets/
      info_row.dart                        <-- Reusable row widget


2. MODEL (Provided)
--------------------
Use the provided employee_model.dart file. Do NOT modify the model structure.


3. STATE MANAGEMENT -- Cubit + States
--------------------------------------
Create proper states:

  abstract class EmployeeProfileState {}

  class EmployeeProfileInitial extends EmployeeProfileState {}

  class EmployeeProfileLoading extends EmployeeProfileState {}

  class EmployeeProfileLoaded extends EmployeeProfileState {
    final EmployeeModel employee;
    EmployeeProfileLoaded(this.employee);
  }

  class EmployeeProfileError extends EmployeeProfileState {
    final String message;
    EmployeeProfileError(this.message);
  }


4. REPOSITORY PATTERN
----------------------

Abstract Repository (Domain layer):

  abstract class EmployeeRepository {
    Future<EmployeeModel> getEmployeeById(String employeeId);
  }

Repository Implementation (Data layer):

  class EmployeeRepositoryImpl implements EmployeeRepository {
    final EmployeeRemoteDataSource remoteDataSource;

    EmployeeRepositoryImpl({required this.remoteDataSource});

    @override
    Future<EmployeeModel> getEmployeeById(String employeeId) {
      return remoteDataSource.getEmployeeById(employeeId);
    }
  }


5. FIREBASE DATA SOURCE
-------------------------

  class EmployeeRemoteDataSource {
    final FirebaseFirestore firestore;

    EmployeeRemoteDataSource({required this.firestore});

    Future<EmployeeModel> getEmployeeById(String employeeId) async {
      final doc = await firestore.collection('employees').doc(employeeId).get();

      if (!doc.exists) {
        throw Exception('Employee not found');
      }

      return EmployeeModel.fromJson(doc.data()!, docId: doc.id);
    }
  }


6. REUSABLE COMPONENTS (Must Extract)
--------------------------------------
You must create reusable widgets -- do not duplicate code:

  Widget            Purpose
  -------           --------
  InfoSection       Section with colored header + list of rows
  InfoRow           Single row: icon + label + value
  EmployeeInfoCard  Left panel (avatar, name, bio, chat button)
  EmployeeWorkInfoCard  Right panel (all 3 sections)


7. UI REQUIREMENTS
-------------------
- Support light and dark theme
- Use flutter_screenutil for responsive sizing
- Breadcrumb navigation at the top
- Left panel: avatar, name, job title, bio (scrollable), chat button
- Right panel: 3 scrollable sections
- Handle loading, error, and empty states in the UI


========================================================
WHAT NOT TO DO
========================================================

- Do NOT hardcode data in the UI -- all data must come from Cubit -> Repository -> Firebase
- Do NOT put Firebase calls directly in widgets
- Do NOT skip the repository pattern
- Do NOT duplicate widget code -- extract reusable components
- Do NOT ignore error/loading states


========================================================
REQUIRED PACKAGES
========================================================

dependencies:
  flutter:
    sdk: flutter
  flutter_screenutil: ^5.9.0
  flutter_bloc: ^8.1.3
  cloud_firestore: ^4.15.0
  firebase_core: ^2.27.0


========================================================
EVALUATION CRITERIA
========================================================

  Criteria                                      Weight
  --------                                      ------
  Clean Architecture (layers separated)         25%
  Cubit + States implemented properly           20%
  Repository + Data Source pattern               15%
  Reusable components (no duplicate code)        15%
  Model used correctly with fromJson/toJson      10%
  UI matches the reference layout                10%
  Error/Loading state handling                    5%


========================================================
TIME LIMIT
========================================================

3 hours


========================================================
PROVIDED FILES
========================================================

1. README.txt              -- This file (task description)
2. employee_model.dart     -- The data model (must use)
3. employee_detailed_info_static.dart -- Static UI reference (visual guide only)

Good luck!
