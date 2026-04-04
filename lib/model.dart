/// Employee Model
/// This model represents an employee document from Firestore.
/// Candidates MUST use this model as-is.
///
/// Firestore Collection: "employees"

class EmployeeModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? photoUrl;
  final String jobTitle;
  final String? bio;
  final PositionDetails positionDetails;
  final WorkingHours workingHours;
  final AcademicInfo academicInfo;
  final List<SkillModel> skills;
  final List<String> hobbies;

  const EmployeeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.photoUrl,
    required this.jobTitle,
    this.bio,
    required this.positionDetails,
    required this.workingHours,
    required this.academicInfo,
    required this.skills,
    required this.hobbies,
  });

  /// Full display name
  String get fullName => '$firstName $lastName';

  /// Skills formatted as comma-separated string
  /// e.g. "Flutter (Expert), Dart (Advanced)"
  String get skillsFormatted {
    if (skills.isEmpty) return '-';
    return skills.map((s) => s.formatted).join(', ');
  }

  /// Hobbies formatted as comma-separated string
  String get hobbiesFormatted {
    if (hobbies.isEmpty) return '-';
    return hobbies.join(', ');
  }

  factory EmployeeModel.fromJson(Map<String, dynamic> json, {String? docId}) {
    return EmployeeModel(
      id: docId ?? json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photoUrl: json['photo_url'],
      jobTitle: json['job_title'] ?? '',
      bio: json['bio'],
      positionDetails: PositionDetails.fromJson(
        json['position_details'] as Map<String, dynamic>? ?? {},
      ),
      workingHours: WorkingHours.fromJson(
        json['working_hours'] as Map<String, dynamic>? ?? {},
      ),
      academicInfo: AcademicInfo.fromJson(
        json['academic_info'] as Map<String, dynamic>? ?? {},
      ),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      hobbies: (json['hobbies'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'photo_url': photoUrl,
      'job_title': jobTitle,
      'bio': bio,
      'position_details': positionDetails.toJson(),
      'working_hours': workingHours.toJson(),
      'academic_info': academicInfo.toJson(),
      'skills': skills.map((s) => s.toJson()).toList(),
      'hobbies': hobbies,
    };
  }
}

// ═══════════════════════════════════════════════
// Position Details
// ═══════════════════════════════════════════════
class PositionDetails {
  final String department;
  final String supervisor;
  final String title;

  const PositionDetails({
    required this.department,
    required this.supervisor,
    required this.title,
  });

  factory PositionDetails.fromJson(Map<String, dynamic> json) {
    return PositionDetails(
      department: json['department'] ?? '',
      supervisor: json['supervisor'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department': department,
      'supervisor': supervisor,
      'title': title,
    };
  }
}

// ═══════════════════════════════════════════════
// Working Hours
// ═══════════════════════════════════════════════
class WorkingHours {
  final String startDate;
  final String hours;
  final List<String> daysOff;
  final String jobLocation;

  const WorkingHours({
    required this.startDate,
    required this.hours,
    required this.daysOff,
    required this.jobLocation,
  });

  /// Days off formatted as comma-separated string
  String get daysOffFormatted {
    if (daysOff.isEmpty) return '-';
    return daysOff.join(', ');
  }

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    return WorkingHours(
      startDate: json['start_date'] ?? '',
      hours: json['hours'] ?? '',
      daysOff: (json['days_off'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      jobLocation: json['job_location'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_date': startDate,
      'hours': hours,
      'days_off': daysOff,
      'job_location': jobLocation,
    };
  }
}

// ═══════════════════════════════════════════════
// Academic Info
// ═══════════════════════════════════════════════
class AcademicInfo {
  final String institutionName;
  final String degree;
  final String graduationYear;

  const AcademicInfo({
    required this.institutionName,
    required this.degree,
    required this.graduationYear,
  });

  factory AcademicInfo.fromJson(Map<String, dynamic> json) {
    return AcademicInfo(
      institutionName: json['institution_name'] ?? '',
      degree: json['degree'] ?? '',
      graduationYear: json['graduation_year'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'institution_name': institutionName,
      'degree': degree,
      'graduation_year': graduationYear,
    };
  }
}

// ═══════════════════════════════════════════════
// Skill Model
// ═══════════════════════════════════════════════
class SkillModel {
  final String name;
  final String level;

  const SkillModel({
    required this.name,
    required this.level,
  });

  /// Formatted display: "Flutter (Expert)"
  String get formatted => level.isEmpty ? name : '$name ($level)';

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] ?? '',
      level: json['level'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
    };
  }
}