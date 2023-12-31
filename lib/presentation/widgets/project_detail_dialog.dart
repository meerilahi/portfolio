import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/responsive_layout_constants.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/data/models/portfolio_data_model.dart';

class ProjectDetailDialog extends StatelessWidget {
  const ProjectDetailDialog({
    Key? key,
    required this.portfolioItem,
  }) : super(key: key);
  final PortfolioItem portfolioItem;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double ratio = width > fBP ? 6 : 10;
    final count = width > fBP ? 2 : 1;
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
          maxHeight: 660,
          minWidth: 400,
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                portfolioItem.name.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 170,
                child: GridView.count(
                  crossAxisCount: count,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: ratio,
                  children: [
                    ListTile(
                      leading: TextButton(
                        child: const Icon(
                          Icons.open_in_new,
                          color: Color.fromARGB(255, 28, 42, 240),
                        ),
                        onPressed: () {
                          try {
                            html.window.open(
                              portfolioItem.webLink,
                              "_blank",
                            );
                          } catch (_) {}
                        },
                      ),
                      title: SelectableText(
                        "Project Link : ${portfolioItem.webLink}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: mediumGrey,
                      ),
                      title: SelectableText(
                        "Client : ${portfolioItem.clientName}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.code,
                        color: mediumGrey,
                      ),
                      title: SelectableText(
                        "Tech Stack : ${portfolioItem.techStack}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: mediumGrey,
                      ),
                      title: SelectableText(
                        "Client Contact : ${portfolioItem.clientContact}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 320,
                child: Image(
                  image: NetworkImage(portfolioItem.imageLink),
                  fit: BoxFit.cover,
                  errorBuilder: (a, b, c) {
                    return const Center(
                      child: Text("No Image"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
