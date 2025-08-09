// models/project.dart
class Project {
  final String title;
  final String? subtitle; // e.g., Playstore, web app
  final List<String> highlights; // bullet points / responsibilities
  final List<String> skills;
  final String timeframe; // optional like "Mar 2021 - Feb 2022"
  final String? platform; // e.g., "playstore", "web"
  final String? note; // short tagline or extra label

  Project({
    required this.title,
    this.subtitle,
    required this.highlights,
    required this.skills,
    this.timeframe = '',
    this.platform,
    this.note,
  });
}

// example usage: provide the project list somewhere
final List<Project> allProjects = [
  Project(
    title: 'Questo Outdoor Escape Games',
    subtitle: 'Playstore',
    highlights: [
      'Built using Flutter, Dart, flutter_bloc for state management.',
      'Developed an app combining outdoor escape rooms, scavenger hunts, and puzzle games.',
      'Integrated Mapbox and Google Location API for real-world exploration features.',
      'Implemented in-app purchases for unlocking premium content and features.',
      'Added notifications to keep users engaged with real-time updates.',
      'Led daily client feedback sessions as the primary contact to ensure smooth project progression.',
    ],
    skills: [
      'Flutter',
      'Dart',
      'flutter_bloc',
      'Mapbox',
      'Google Location API',
      'In-app Purchases',
      'Notifications',
      'Client Communication',
    ],
  ),
  Project(
    title: 'HSC (Stem Cell Collection Management System)',
    highlights: [
      'Built using Flutter, Dart, flutter_bloc for state management.',
      'Developed a web application for managing stem cell collection and delivery processes.',
      'Handled multiple user roles: drivers, customers, and doctors.',
      'Implemented complex workflows with BLoC.',
      'Led daily stand-up calls with the client for feedback and alignment.',
    ],
    skills: [
      'Flutter Web',
      'Dart',
      'flutter_bloc',
      'Role Management',
      'Client Communication',
    ],
  ),
  Project(
    title: 'Treadstone Capital',
    subtitle: 'Playstore',
    highlights: [
      'Built using Flutter, Dart, flutter_bloc for state management.',
      'App for managing real-time credit data and invoices for brokers.',
      'Integrated REST APIs for real-time updates on invoice status and credit data.',
      'Collaborated with the client daily to align project goals and deliverables.',
    ],
    skills: ['Flutter', 'REST API', 'State Management', 'Client Collaboration'],
  ),
  Project(
    title: 'DRS (Diabetic Retinopathy Screening)',
    highlights: [
      'Developed a Flutter web app with multiple user roles: Site, Hospital, Server Users.',
      'Integrated tools for managing users, hospitals, and patients.',
      'Led daily stand-up calls to ensure feedback integration.',
    ],
    skills: ['Flutter Web', 'User Management', 'Client Communication'],
  ),
  Project(
    title: 'Retsy',
    subtitle: 'Playstore',
    highlights: [
      'Built using Flutter, Dart, flutter_bloc and Firebase for storage.',
      'Platform for real estate transactions including buying and selling properties.',
      'Implemented notifications for listing updates and interactions.',
      'Led client discussions for feedback-driven feature adjustments.',
    ],
    skills: ['Flutter', 'Firebase', 'Notifications', 'Client Feedback'],
  ),
  Project(
    title: 'Closest Airport',
    highlights: [
      'Mobile app providing real-time flight routes and nearest airport locations.',
      'Integrated REST APIs to fetch flight and airport details.',
      'Maintained daily client communication to align feature set and timelines.',
    ],
    skills: ['REST API', 'Real-time Data', 'Client Communication'],
  ),
  Project(
    title: 'LovelyU',
    highlights: [
      'Random video calling app with coin-based interactions.',
      'Integrated Agora SDK for high-quality video and real-time chat.',
      'Implemented notifications for call updates and user activity.',
      'Led client discussions for feature prioritization.',
    ],
    skills: [
      'Agora SDK',
      'Realtime Chat',
      'Notifications',
      'Client Collaboration',
    ],
  ),
  Project(
    title: 'Fhunger',
    subtitle: 'Playstore',
    timeframe: 'Mar 2021 - Feb 2022',
    highlights: [
      'Built using Flutter, Dart, flutter_bloc for state management.',
      'Contributed to planning, estimation, and progress reporting.',
      'Led deployment to Google Play and Apple App Store ensuring guideline compliance.',
      'Customized Google Maps API for nearby store discovery with real-time backend data.',
      'Implemented real-time notification handling for order/status updates.',
    ],
    skills: [
      'Flutter',
      'Maps Integration',
      'Notifications',
      'Deployment',
      'State Management',
    ],
    note: 'BitsAtom Technologies',
  ),
  Project(
    title: 'Fhunger Partner',
    subtitle: 'Playstore',
    highlights: [
      'Built using Flutter, Dart, flutter_bloc and espos for printer integration.',
      'Participated in planning, estimation, and reporting with the dev team.',
      'Implemented real-time notifications for order status changes.',
      'Managed app submission and deployment for both Android and iOS.',
    ],
    skills: ['Flutter', 'Printer Integration', 'Notifications', 'Deployment'],
  ),
  Project(
    title: 'Kymani',
    subtitle: 'Playstore',
    highlights: [
      'Built using Flutter, Dart, flutter_bloc for state management.',
      'Supported sprint reporting and planning with the development team.',
      'Implemented real-time push notifications for user engagement.',
      'Handled end-to-end deployment to app stores.',
      'Built social media-like features: image/video sharing, follows.',
    ],
    skills: ['Flutter', 'Push Notifications', 'Social Features', 'Deployment'],
  ),
];
