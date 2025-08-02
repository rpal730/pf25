import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_colors.dart';
import 'package:flutter_web_portfolio_2025/res/ui_helper.dart';
import 'package:flutter_web_portfolio_2025/screens/screen2/model/project.dart';
import 'package:flutter_web_portfolio_2025/screens/screen2/view/project_card.dart';


class ProjectDetailScreen extends StatelessWidget {
  final List<Project> projects;

  const ProjectDetailScreen({
    super.key,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBase,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text('Projects & Work'),
      ),
      body: Center(
        child: SizedBox(
        
          width: figmaScreenWidth,
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, i) {
              final project = projects[i];
              return ProjectCard(
                project: project,
                onTap: () async{
                  // optional: expand into full project detail modal/page
                 await showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      
                      backgroundColor: AppColors.secondary.shade50,
                      insetPadding: const EdgeInsets.all(24),
                      child: SizedBox(
                        width: figmaScreenWidth,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(project.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              if (project.subtitle != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(project.subtitle!,
                                      style: TextStyle(color: AppColors.textBase.withOpacity(0.75))),
                                ),
                              if (project.timeframe.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(project.timeframe,
                                      style: TextStyle(color: AppColors.textBase.withOpacity(0.6))),
                                ),
                              const SizedBox(height: 16),
                              const Text('Overview', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 6),
                              ...project.highlights.map(
                                (h) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('• '),
                                      Expanded(child: Text(h)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              const Text('Skills Used', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Wrap(
                                spacing: 8,
                                runSpacing: 6,
                                children: project.skills
                                    .map(
                                      (s) => Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondary.shade100,
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: AppColors.textBase, width: 1),
                                        ),
                                        child: Text(s, style: const TextStyle(fontSize: 12)),
                                      ),
                                    )
                                    .toList(),
                              ),
                              if ((project.note ?? '').isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text('Note: ${project.note}'),
                                ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.accentPeach,
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Close'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

