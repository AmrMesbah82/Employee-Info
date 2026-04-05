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
- Left panel: avatar, name, job title, bio (scrollable), chat button
- Right panel: 3 scrollable sections
- Handle loading, error, and empty states in the UI


8. Links File 
-------------------

 Url : https://drive.google.com/drive/folders/1HDihbwYUjqRlwpqjtmqspKmNxCCRWV4m?usp=drive_link


========================================================
WHAT NOT TO DO
========================================================

- Do NOT hardcode data in the UI -- all data must come from Cubit -> Repository -> Firebase
- Do NOT put Firebase calls directly in widgets
- Do NOT skip the repository pattern
- Do NOT duplicate widget code -- extract reusable components
- Do NOT ignore error/loading states


========================================================
Important matters to consider in your submission
========================================================
                                    
  1- Clean Architecture (layers separated)         
  2- Cubit + States implemented properly           
  3- Repository + Data Source pattern               
  4- Reusable components (no duplicate code)        
  5- Model used correctly with fromJson/toJson      
  6- UI matches the reference layout                
  7- Error/Loading state handling                    


========================================================
TIME LIMIT
========================================================

2.5 hours


========================================================
PROVIDED FILES
========================================================

1. README.txt              -- This file (task description)
2. employee_model.dart     -- The data model (must use)
3. employee_detailed_info_static.dart -- Static UI reference (visual guide only)

// ─────────────────────────────────────────────────────────────────────────────
// RULES
// ─────────────────────────────────────────────────────────────────────────────
//
//  - You must share your screen and keep your camera on for the entire session.
//  - You may use documentation (Flutter docs, pub.dev, Firebase docs)
//    — no AI tools or copy-pasting from existing projects.
//  - Explain your decisions as you code — we want to see your thought process.
//  - Ask questions if anything is unclear — this is part of the evaluation.
//
//
// ─────────────────────────────────────────────────────────────────────────────
// Good luck!
// ─────────────────────────────────────────────────────────────────────────────
