// widgets/project_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/brutalism_container.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/screens/screen2/model/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({super.key, required this.project, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BrutalismContainer(
      topBorderBold: true,
      bottomBorderBold: true,
      color: AppColors.random,
      borderRadius: 14,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: title + subtitle/timeframe
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (project.subtitle != null || project.timeframe.isNotEmpty)
                  Container(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (project.subtitle != null)
                          Text(
                            project.subtitle!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBase.withOpacity(0.75),
                            ),
                          ),
                        if (project.timeframe.isNotEmpty)
                          Text(
                            project.timeframe,
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.textBase.withOpacity(0.6),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            // Highlights (first 2-3 bullets)
            ...project.highlights
                .take(3)
                .map(
                  (h) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontSize: 14)),
                        Expanded(
                          child: Text(h, style: const TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            if (project.highlights.length > 3)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '...and more',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.accentPeach.shade700,
                  ),
                ),
              ),
            const SizedBox(height: 12),
            // Skills
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children:
                  project.skills
                      .map(
                        (s) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.shade50,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.textBase,
                              width: 1,
                            ),
                          ),
                          child: Text(s, style: const TextStyle(fontSize: 11)),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
