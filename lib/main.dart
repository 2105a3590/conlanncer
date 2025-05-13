import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      routes: {
        '/category_list': (context) => const CategoryListPage(),
        '/startup_projects': (context) => const StartupProjectsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildSectionHeader(
                  context, 
                  'Explore projects', 
                  'by categories', 
                  () => Navigator.pushNamed(context, '/category_list')
                ),
                const SizedBox(height: 14),
                _buildCategoriesGrid(),
                const SizedBox(height: 12),
                _buildSectionHeader(
                  context, 
                  'Startup Projects', 
                  '', 
                  () => Navigator.pushNamed(context, '/startup_projects')
                ),
                const SizedBox(height: 12),
                _buildStartupProjects(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String subtitle, VoidCallback onViewAll) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),
        TextButton(
          onPressed: onViewAll,
          child: Row(
            children: const [
              Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesGrid() {
    final categories = [
      {
        'name': 'Brand Identity', 
        'color': Colors.grey[200], 
        'imagePath': 'assets/brand_identity.png'
      },
      {
        'name': 'Web apps', 
        'color': Colors.blue[900], 
        'imagePath': 'assets/web_apps.png'
      },
      {
        'name': 'Social Media', 
        'color': Colors.orange[300], 
        'imagePath': 'assets/social_media.png'
      },
      {
        'name': 'Video Production', 
        'color': Colors.purple[400], 
        'imagePath': 'assets/video_production.png'
      },
      {
        'name': 'Whatsapp ads', 
        'color': Colors.green[400], 
        'imagePath': 'assets/whatsapp_ads.png'
      },
      {
        'name': 'Product Design', 
        'color': Colors.teal[300], 
        'imagePath': 'assets/product_design.png'
      },
    ];

    return SizedBox(
      height: 220,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(
            category['name'] as String,
            category['color'] as Color?,
            category['imagePath'] as String,
          );
        },
      ),
    );
  }

  Widget _buildCategoryCard(String name, Color? color, String imagePath) {
    return Card(
      color: color,
      clipBehavior: Clip.antiAlias, // Important for image overflow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          // Background image with overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.7, // Adjust for visibility of text over image
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark gradient overlay to ensure text readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartupProjects() {
    final startups = [
      {
        'name': 'Lasso',
        'backgroundImage': 'assets/lasso_bg.png',
      },
      {
        'name': 'Video Production',
        'backgroundImage': 'assets/video_production.png',
      },
      {
        'name': 'Web apps',
        'backgroundImage': 'assets/web_apps.png',
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: startups.length,
        itemBuilder: (context, index) {
          final startup = startups[index];
          return _buildStartupProjectCard(
            startup['name'] as String,
            startup['backgroundImage'] as String,
          );
        },
      ),
    );
  }

  Widget _buildStartupProjectCard(String name, String backgroundImage) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient overlay for better text visibility
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          // Project name
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page that shows the full category list
class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Brand Identity', 
        'color': Colors.grey[200], 
        'imagePath': 'assets/brand_identity.png'
      },
      {
        'name': 'Web apps', 
        'color': Colors.blue[900], 
        'imagePath': 'assets/web_apps.png'
      },
      {
        'name': 'Social Media', 
        'color': Colors.orange[300], 
        'imagePath': 'assets/social_media.png'
      },
      {
        'name': 'Video Production', 
        'color': Colors.purple[400], 
        'imagePath': 'assets/video_production.png'
      },
      {
        'name': 'Whatsapp ads', 
        'color': Colors.green[400], 
        'imagePath': 'assets/whatsapp_ads.png'
      },
      {
        'name': 'Product Design', 
        'color': Colors.teal[300], 
        'imagePath': 'assets/product_design.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Categories'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return _buildCategoryCard(
              category['name'] as String,
              category['color'] as Color?,
              category['imagePath'] as String,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String name, Color? color, String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Category image
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          // Gradient overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Category name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Page that shows all startup projects
class StartupProjectsPage extends StatelessWidget {
  const StartupProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final startups = [
      {
        'name': 'Lasso', 
        'backgroundImage': 'assets/lasso_bg.png',
        'description': '...',
      },
      {
        'name': 'Web apps', 
        'logoPath': null,
        'backgroundImage': 'assets/web_apps.png',
        'description': '...',
      },
      {
        'name': 'Video Production', 
        'logoPath': null,
        'backgroundImage': 'assets/video_production.png',
        'description': '...',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Projects'),
        foregroundColor:null ,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: startups.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: .1.0,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final startup = startups[index];
            return _buildStartupCard(
              startup['name'] as String,
              startup['logoPath'] as String?,
              startup['backgroundImage'] as String,
              startup['description'] as String,
            );
          },
        ),
      ),
    );
  }

  Widget _buildStartupCard(
    String name, 
    String? logoPath, 
    String backgroundImage, 
    String description
  ) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo if available
                if (logoPath != null)
                  Image.asset(
                    logoPath,
                    width: 40,
                    height: 40,
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
