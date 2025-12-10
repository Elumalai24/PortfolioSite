import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:web_dev/utils/app_colors.dart';
import 'package:web_dev/utils/data.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildNavBar(context),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 100),
            _buildSectionTitle("About Me", _aboutKey),
            _buildAboutSection(),
            const SizedBox(height: 100),
            _buildSectionTitle("Skills", _skillsKey),
            _buildSkillsSection(),
            const SizedBox(height: 100),
            _buildSectionTitle("Experience", _experienceKey),
            _buildExperienceSection(),
            const SizedBox(height: 100),
            _buildSectionTitle("Projects", _projectsKey),
            _buildProjectsSection(),
            const SizedBox(height: 100),
            _buildSectionTitle("Contact", _contactKey),
            _buildContactSection(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildNavBar(BuildContext context) {
    // Simple responsive nav bar
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Text(
        Data.name,
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: MediaQuery.of(context).size.width > 700
          ? [
              _navItem("About", _aboutKey),
              _navItem("Experience", _experienceKey),
              _navItem("Projects", _projectsKey),
              _navItem("Contact", _contactKey),
              const SizedBox(width: 20),
            ]
          : null, // Use drawer or simple list for mobile if needed, for now keep simple
    );
  }

  Widget _navItem(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollTo(key),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, my name is",
            style: TextStyle(color: AppColors.primary, fontSize: 18),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 10),
          Text(
            Data.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
          Text(
            Data.title,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          SizedBox(
            width: 600,
            child: Text(
              Data.tagline,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ).animate().fadeIn(delay: 600.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 40),
          OutlinedButton(
            onPressed: () => _scrollTo(_projectsKey),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            ),
            child: const Text(
              "Check out my work!",
              style: TextStyle(color: AppColors.primary, fontSize: 16),
            ),
          ).animate().fadeIn(delay: 800.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, GlobalKey key) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Divider(color: AppColors.textSecondary, thickness: 0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return SizedBox(
      width: 800,
      child: Text(
        Data.about,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          height: 1.6,
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1, end: 0);
  }

  Widget _buildSkillsSection() {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: Data.skills
          .map((skill) => Chip(
                backgroundColor: AppColors.secondary,
                avatar: Icon(skill.icon, color: AppColors.primary, size: 20),
                label: Text(
                  skill.name,
                  style: const TextStyle(color: AppColors.primary, fontSize: 16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                side: BorderSide.none,
              ).animate().fadeIn(duration: 500.ms).scale(delay: 100.ms))
          .toList(),
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Data.experience
          .map((exp) => _buildExperienceItem(exp)
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.1, end: 0))
          .toList(),
    );
  }

  Widget _buildExperienceItem(Experience exp) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                exp.role,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                exp.period,
                style: TextStyle(color: AppColors.primary, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            exp.company,
            style: const TextStyle(color: AppColors.primary, fontSize: 16),
          ),
          const SizedBox(height: 15),
          Text(
            exp.description,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: Data.projects.length,
          itemBuilder: (context, index) {
            return _buildProjectCard(Data.projects[index])
                .animate()
                .fadeIn(duration: 600.ms, delay: (index * 100).ms)
                .slideY(begin: 0.1, end: 0);
          },
        );
      },
    );
  }

  Widget _buildProjectCard(Project project) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(FontAwesomeIcons.folder, color: AppColors.primary, size: 40),
          const SizedBox(height: 20),
          Text(
            project.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            project.description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.4,
            ),
            //maxLines: 5,
            //overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: project.techStack
                .map((tech) => Text(
                      tech,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                        fontFamily: "SpaceMono", // Optional if font added
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Get In Touch",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          const SizedBox(
            width: 600,
            child: Text(
              "I'm currently looking for new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 50),
          OutlinedButton(
            onPressed: () async {
              // Add mail to logic
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'elumalai.j@example.com', // User didn't provide email explicitly in Resume
                query: 'subject=Hello&body=Hi Elumalai,',
              );
              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              }
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            ),
            child: const Text(
              "Say Hello",
              style: TextStyle(color: AppColors.primary, fontSize: 18),
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 600.ms).scale(),
        ],
      ),
    );
  }
}
