import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Project {
  final String title;
  final String description;
  final List<String> techStack;
  final String? link;

  Project({
    required this.title,
    required this.description,
    required this.techStack,
    this.link,
  });
}

class Experience {
  final String company;
  final String role;
  final String period;
  final String description;

  Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
  });
}

class Skill {
  final String name;
  final IconData icon;

  Skill({required this.name, required this.icon});
}

class Data {
  static const String name = "Elumalai J";
  static const String title = "Flutter Developer";
  static const String tagline = "Building high-quality mobile applications with Flutter.";
  static const String about = 
      "As a Flutter developer with 3.8 years of experience, I seek to leverage my technical skills and passion for creating high-quality mobile applications to contribute to a dynamic team. My objective is to deliver user-centered, scalable, and efficient solutions while adhering to best practices in Flutter and cross-platform development. I aim to continuously improve my expertise in mobile architecture, design, and performance optimization.";
  
  static const String email = "CONTACT ME"; 

  static final List<Experience> experience = [
    Experience(
      company: "IMPACTEERS",
      role: "Flutter Developer",
      period: "Dec 2024 - Present",
      description: "Demonstrated strong leadership in managing teams and driving project success through effective coordination and guidance. Took ownership of critical tasks, ensuring timely and high-quality delivery even under pressure. Proactively embraced advanced tools and technologies, including CI/CD pipelines and automated deployment processes for Play Store and App Store releases.",
    ),
    Experience(
      company: "CULTURE KREA TECHNOLOGIES PVT LTD",
      role: "Flutter Developer",
      period: "Jan 2024 - Nov 2024",
      description: "Experienced Flutter Developer skilled in deep linking, WebSockets for real-time updates, and GraphQL for efficient data handling. Proficient in using Bloc for state management and implementing complex navigation flows. Skilled in optimizing performance, integrating platform-specific features, and ensuring a seamless user experience.",
    ),
    Experience(
      company: "TALEXO SOLUTION PVT LTD",
      role: "Flutter Developer",
      period: "Oct 2023 - Dec 2023",
      description: "Experienced in iOS app development, with a strong focus on creating high-quality, user-focused applications. Proficient in using the Bloc pattern for efficient state management, resulting in clean, maintainable code.",
    ),
    Experience(
      company: "TECH4LYF ENTERPRENEURS",
      role: "Flutter Developer",
      period: "Jan 2022 - Aug 2023",
      description: "Started my career as a Flutter developer, building and maintaining various high-performance, user-centered apps. Proficient in state management, API integration, and performance optimization, consistently delivering quality apps on time.",
    ),
  ];

  static final List<Project> projects = [
    Project(
      title: "Impacteers",
      description: "The platform supports users in advancing their careers by providing access to job listings, educational resources, and professional guidance. Managed and optimized various modules ensuring a smooth user experience. Managed deployment for Play Store and App Store.",
      techStack: ["Flutter", "Firebase", "REST API", "Bloc", "Riverpod", "WebSocket", "Payment Gateways", "CleverTap"],
    ),
    Project(
      title: "GlueBlu",
      description: "An employee experience enhancement app with features like Connect, Rewards & Recognition, OKRs, Performance Reviews, 360° Feedback, and Task Management.",
      techStack: ["Flutter", "Firebase", "REST API", "Provider", "WebSocket", "AppStore", "Multi-threading"],
    ),
    Project(
      title: "Deejos",
      description: "A customer portal app for an architecture firm, enabling clients to view project updates, designs, and discuss directly with the team.",
      techStack: ["Flutter", "Firebase", "REST API", "Provider", "MVC", "Problem Solving"],
    ),
    Project(
      title: "ZC360",
      description: "A video booth controller app designed to manage video recording and playback for events and booths.",
      techStack: ["Flutter", "Provider", "REST API", "Video Player", "Google Play Store"],
    ),
    Project(
      title: "Gatello",
      description: "A social networking app with real-time chat, calls, feeds, status posting, push notifications and a career page. Revamped the entire UI and reworked the chat interface.",
      techStack: ["Flutter", "Dart", "Firebase", "MVVM", "REST API", "Bloc", "Json"],
    ),
  ];

  static final List<Skill> skills = [
    Skill(name: "Flutter", icon: FontAwesomeIcons.flutter),
    Skill(name: "Dart", icon: FontAwesomeIcons.code),
    Skill(name: "Android", icon: FontAwesomeIcons.android),
    Skill(name: "iOS", icon: FontAwesomeIcons.apple),
    Skill(name: "Flutter Web", icon: FontAwesomeIcons.globe),
    Skill(name: "Clean Architecture", icon: FontAwesomeIcons.sitemap),
    Skill(name: "Bloc", icon: FontAwesomeIcons.cubes),
    Skill(name: "Riverpod", icon: FontAwesomeIcons.water),
    Skill(name: "Provider", icon: FontAwesomeIcons.boxesStacked),
    Skill(name: "GetX", icon: FontAwesomeIcons.layerGroup),
    Skill(name: "SQLite", icon: FontAwesomeIcons.database),
    Skill(name: "Hive", icon: FontAwesomeIcons.boxOpen),
    Skill(name: "Firebase", icon: FontAwesomeIcons.fire),
    Skill(name: "REST APIs", icon: FontAwesomeIcons.server),
    Skill(name: "GraphQL", icon: FontAwesomeIcons.circleNodes),
    Skill(name: "WebSocket", icon: FontAwesomeIcons.plug),
    Skill(name: "Payments", icon: FontAwesomeIcons.creditCard),
    Skill(name: "Push Notifications", icon: FontAwesomeIcons.bell),
    Skill(name: "Background Services", icon: FontAwesomeIcons.gears),
    Skill(name: "App Security", icon: FontAwesomeIcons.shieldHalved),
    Skill(name: "Agora", icon: FontAwesomeIcons.video),
    Skill(name: "Hosting", icon: FontAwesomeIcons.cloudArrowUp),
    Skill(name: "CI/CD (Codemagic)", icon: FontAwesomeIcons.infinity),
    Skill(name: "Unit Testing", icon: FontAwesomeIcons.vial),
    Skill(name: "Performance", icon: FontAwesomeIcons.gaugeHigh),
    Skill(name: "Store Deployment", icon: FontAwesomeIcons.store),
    Skill(name: "Git", icon: FontAwesomeIcons.gitAlt),
  ];
}
