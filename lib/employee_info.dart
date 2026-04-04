import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ──────────────────────────────────────────────
// Static Employee Profile Screen (UI Only)
// Single file - no controllers, no Firebase
// ──────────────────────────────────────────────

class EmployeeDetailedInfoStatic extends StatefulWidget {
  const EmployeeDetailedInfoStatic({super.key});

  @override
  State<EmployeeDetailedInfoStatic> createState() =>
      _EmployeeDetailedInfoStaticState();
}

class _EmployeeDetailedInfoStaticState
    extends State<EmployeeDetailedInfoStatic> {
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isLight = brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLight ? const Color(0xFFF5F5F5) : const Color(0xFF1A1A2E),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          children: [
            // ── Breadcrumbs ──
            _buildBreadcrumbs(isLight),
            SizedBox(height: 30.sp),

            // ── Main Content ──
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left: Employee Info Card
                  Expanded(
                    flex: 2,
                    child: _buildEmployeeInfoCard(isLight),
                  ),
                  SizedBox(width: 15.w),
                  // Right: Work Info Card
                  Expanded(
                    flex: 3,
                    child: _buildWorkInfoCard(isLight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════
  // BREADCRUMBS
  // ═══════════════════════════════════════════
  Widget _buildBreadcrumbs(bool isLight) {
    final textColor = isLight ? Colors.black87 : Colors.white;
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Text(
            'Organization Chart',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Icon(Icons.chevron_right, size: 24.sp, color: textColor),
        ),
        Text(
          'Employee Info',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════
  // LEFT CARD — Employee Personal Info
  // ═══════════════════════════════════════════
  Widget _buildEmployeeInfoCard(bool isLight) {
    final cardColor = isLight ? Colors.white : const Color(0xFF16213E);
    final textColor = isLight ? Colors.black87 : Colors.white;
    final subtitleColor = isLight ? Colors.black54 : Colors.white70;
    final primaryColor = isLight ? const Color(0xFF1E88E5) : const Color(0xFF64B5F6);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: primaryColor),
                      ),
                      padding: EdgeInsets.all(3.sp),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade200,
                        child: Icon(Icons.person, size: 40.sp, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Name
                    Text(
                      'Ahmed Mohamed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        letterSpacing: 1.2,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Job Title
                    Text(
                      'Senior Flutter Developer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: subtitleColor,
                        height: 1.2,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Bio
                    SizedBox(
                      height: 200.h,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          'Experienced mobile developer with 5+ years in Flutter and Dart. '
                              'Passionate about building scalable enterprise applications with '
                              'clean architecture and responsive UI design. Skilled in Firebase, '
                              'BLoC pattern, and cross-platform development.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: subtitleColor,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Chat Button
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat_bubble_outline, size: 18.sp),
                label: Text(
                  'Chat',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: Size(150.w, 38.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════
  // RIGHT CARD — Work Info
  // ═══════════════════════════════════════════
  Widget _buildWorkInfoCard(bool isLight) {
    final cardColor = isLight ? Colors.white : const Color(0xFF16213E);

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Position Details ──
            _InfoSection(
              title: 'Position Details',
              isLight: isLight,
              items: const [
                _InfoItem(icon: Icons.business, label: 'Department:', value: 'Technology & Development'),
                _InfoItem(icon: Icons.supervisor_account, label: 'Supervisor:', value: 'Mohamed Ali'),
                _InfoItem(icon: Icons.email_outlined, label: 'Email:', value: 'ahmed.mohamed@company.com'),
                _InfoItem(icon: Icons.phone_outlined, label: 'Phone:', value: '+20 1012345678'),
                _InfoItem(icon: Icons.badge_outlined, label: 'Title:', value: 'Senior Developer'),
              ],
            ),

            SizedBox(height: 16.h),

            // ── Working Hours ──
            _InfoSection(
              title: 'Working Hours',
              isLight: isLight,
              items: const [
                _InfoItem(icon: Icons.calendar_today, label: 'Start Date:', value: 'Jan 15, 2021'),
                _InfoItem(icon: Icons.access_time, label: 'Working Hours:', value: '9:00 AM - 5:00 PM'),
                _InfoItem(icon: Icons.weekend_outlined, label: 'Days Off:', value: 'Friday, Saturday'),
                _InfoItem(icon: Icons.location_on_outlined, label: 'Job Location:', value: 'Cairo, Egypt'),
              ],
            ),

            SizedBox(height: 16.h),

            // ── General Information ──
            _InfoSection(
              title: 'General Information',
              isLight: isLight,
              items: const [
                _InfoItem(icon: Icons.school_outlined, label: 'Institution Name:', value: 'Cairo University'),
                _InfoItem(icon: Icons.workspace_premium, label: 'Degree:', value: "Bachelor's Degree"),
                _InfoItem(icon: Icons.date_range, label: 'Graduation Year:', value: '2018'),
                _InfoItem(icon: Icons.psychology_outlined, label: 'Skills:', value: 'Flutter (Expert), Dart (Expert), Firebase (Advanced), REST APIs (Advanced)'),
                _InfoItem(icon: Icons.sports_esports_outlined, label: 'Hobbies:', value: 'Reading, Football, Travelling'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════
// REUSABLE: Info Section with Title + Items
// ═══════════════════════════════════════════════
class _InfoSection extends StatelessWidget {
  final String title;
  final bool isLight;
  final List<_InfoItem> items;

  const _InfoSection({
    required this.title,
    required this.isLight,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final headerColor = isLight ? const Color(0xFF1E88E5) : const Color(0xFF64B5F6);
    final dividerColor = isLight ? Colors.grey.shade200 : Colors.white12;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: headerColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: headerColor,
            ),
          ),
        ),
        SizedBox(height: 8.h),

        // Items
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              _buildInfoRow(item, isLight),
              if (index < items.length - 1)
                Divider(color: dividerColor, height: 1),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildInfoRow(_InfoItem item, bool isLight) {
    final labelColor = isLight ? Colors.black54 : Colors.white60;
    final valueColor = isLight ? Colors.black87 : Colors.white;
    final iconColor = isLight ? const Color(0xFF1E88E5) : const Color(0xFF64B5F6);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, size: 20.sp, color: iconColor),
          SizedBox(width: 10.w),
          SizedBox(
            width: 140.w,
            child: Text(
              item.label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: labelColor,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              item.value,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════
// DATA CLASS: Single info row
// ═══════════════════════════════════════════════
class _InfoItem {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}