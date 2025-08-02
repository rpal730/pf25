import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/tappable_effect.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:url_launcher/url_launcher.dart';
class ProfileHero extends StatelessWidget {
  
  const ProfileHero({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.secondary.shade100,
        width: figmaScreenWidth,
        constraints: BoxConstraints(minHeight: figmaScreenHeight),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Stack(
            children: [
              // Background block for contrast
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: figmaScreenWidth,
                  height: figmaScreenHeight * 0.45,
                  decoration: BoxDecoration(
                    color: AppColors.primary.shade200,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),

              // Foreground content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer to push below bg block
                  SizedBox(height: 60),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile / avatar
                      BrutalismContainer(
                        topBorderBold: true,
                        bottomBorderBold: true,
                        color: AppColors.accentPeach.shade200,
                        borderRadius: 16,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.primary.shade500,
                              child: const Text(
                                'R',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Rahul Pal',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              'Flutter Developer',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 24),

                      // Info column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BrutalismContainer(
                              topBorderBold: true,
                              bottomBorderBold: false,
                              color: AppColors.backgroundBase,
                              borderRadius: 16,
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'About Me',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'I build responsive Flutter web apps with thoughtful UX, strong state management, and real-time features. Currently working on Fhunger Partner for restaurant order management.',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Skills',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 6,
                                    children: const [
                                      _SkillChip(label: 'Flutter'),
                                      _SkillChip(label: 'Dart'),
                                      _SkillChip(label: 'Firebase'),
                                      _SkillChip(label: 'Bloc'),
                                      _SkillChip(label: 'Web'),
                                      _SkillChip(label: 'REST API'),
                                      _SkillChip(label: 'CI/CD'),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                           
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),
                   // Contact / socials
                            BrutalismContainer(
                              topBorderBold: false,
                              bottomBorderBold: true,
                              color: AppColors.accentYellow.shade100,
                              borderRadius: 16,
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Contact',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text('Email: rahulpalofficial1998@gmail.com'),
                                        Text('Location: India'),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      _IconBadge(icon: Icons.link, tooltip: 'LinkedIn'),
                                      SizedBox(width: 8),
                                      _IconBadge(icon: Icons.code, tooltip: 'GitHub'),
                                      SizedBox(width: 8),
                                      _IconBadge(icon: Icons.email, tooltip: 'Email'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                              const SizedBox(height: 60),

                  // Experience / recent projects
                  BrutalismContainer(
                    topBorderBold: true,
                    bottomBorderBold: true,
                    color: AppColors.white,
                    borderRadius: 16,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recent Projects',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        _ProjectTile(
                          title: 'Fhunger Partner',
                          subtitle: 'Restaurant order management web app',
                          tags: ['Flutter Web', 'Realtime', 'CI/CD'],
                        ),
                        const SizedBox(height: 8),
                        _ProjectTile(
                          title: 'Custom Question Form',
                          subtitle: 'Dynamic form handling with follow-ups',
                          tags: ['Dart', 'State Management'],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textBase, width: 1.5),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  const _IconBadge({required this.icon, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return TappableEffect(
      onTap: () {
        if (icon == Icons.link) {
          launchUrl(Uri.parse('https://www.linkedin.com/in/rahulpal0/'));
        } else if (icon == Icons.code) {
          launchUrl(Uri.parse('https://github.com/rpal730/'));
        }else if(icon == Icons.email){
          launchUrl(Uri.parse('mailto: rahulpalofficial1998@gmail.com'));
        }
      },
      child: Tooltip(
        message: tooltip,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.shade300,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.textBase, width: 2),
          ),
          child: Icon(
            icon,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> tags;

  const _ProjectTile({
    required this.title,
    required this.subtitle,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return BrutalismContainer(
      topBorderBold: false,
      bottomBorderBold: false,
      color: AppColors.secondary.shade50,
      borderRadius: 12,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            children: tags
                .map((t) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accentPeach.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        t,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}