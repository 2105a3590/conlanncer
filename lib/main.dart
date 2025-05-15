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
        '/business_projects':
            (context) => const CategoryProjectsPage(title: 'Business Projects'),
        '/youtube_projects':
            (context) => const CategoryProjectsPage(title: 'YouTube Projects'),
        '/instagram_projects':
            (context) =>
                const CategoryProjectsPage(title: 'Instagram Projects'),
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
                // 1. Explore Page Section
                _buildSectionHeader(
                  context,
                  'Explore projects',
                  'by categories',
                  () => Navigator.pushNamed(context, '/category_list'),
                ),
                const SizedBox(height: 14),
                _buildCategoriesGrid(),

                const SizedBox(height: 24),
                // 2. Startup Projects Section
                _buildSectionHeader(
                  context,
                  'Startup Projects',
                  '',
                  () => Navigator.pushNamed(context, '/startup_projects'),
                ),
                const SizedBox(height: 12),
                _buildStartupProjects(),

                const SizedBox(height: 24),
                // 3. Business Projects Section
                _buildSectionHeader(
                  context,
                  'Business Projects',
                  '',
                  () => Navigator.pushNamed(context, '/business_projects'),
                ),
                const SizedBox(height: 12),
                _buildBusinessProjects(),

                const SizedBox(height: 24),
                // 4. YouTube Projects Section
                _buildSectionHeader(
                  context,
                  'YouTube Projects',
                  '',
                  () => Navigator.pushNamed(context, '/youtube_projects'),
                ),
                const SizedBox(height: 12),
                _buildYoutubeProjects(),

                const SizedBox(height: 24),
                // 5. Instagram Projects Section
                _buildSectionHeader(
                  context,
                  'Instagram Projects',
                  '',
                  () => Navigator.pushNamed(context, '/instagram_projects'),
                ),
                const SizedBox(height: 12),
                _buildInstagramProjects(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onViewAll,
  ) {
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
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
            ],
          ),
        ),
        TextButton(
          onPressed: onViewAll,
          child: Row(
            children: const [
              Text('View all', style: TextStyle(color: Colors.grey)),
              Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  // 1. Explore page components
  Widget _buildCategoriesGrid() {
    final categories = [
      {
        'name': 'Brand Identity',
        'color': Colors.grey[200],
        'imagePath': 'assets/brand_identity.png',
      },
      {
        'name': 'Web apps',
        'color': Colors.blue[900],
        'imagePath': 'assets/web_apps.png',
      },
      {
        'name': 'Social Media',
        'color': Colors.orange[300],
        'imagePath': 'assets/social_media.png',
      },
      {
        'name': 'Video Production',
        'color': Colors.purple[400],
        'imagePath': 'assets/video_production.png',
      },
      {
        'name': 'Whatsapp ads',
        'color': Colors.green[400],
        'imagePath': 'assets/whatsapp_ads.png',
      },
      {
        'name': 'Product Design',
        'color': Colors.teal[300],
        'imagePath': 'assets/product_design.png',
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
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          // Background image with overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          // Dark gradient overlay to ensure text readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
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

  // 2. Startup Projects components
  Widget _buildStartupProjects() {
    final startupProjects = [
      {
        'title': 'Branding & Identify',
        'subtitle': 'Freelancer marketplace',
        'imagePath': 'assets/lasso_bg.png',
        'color': Colors.indigo[700],
      },
      {
        'title': 'Video Production',
        'subtitle': 'Digital banking solution',
        'imagePath': 'assets/web_apps.png',
        'color': Colors.blue[800],
      },
      {
        'title': 'Web App',
        'subtitle': 'Fitness tracking platform',
        'imagePath': 'assets/video_production.png',
        'color': Colors.teal[600],
      },
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: startupProjects.length,
        itemBuilder: (context, index) {
          final project = startupProjects[index];
          return _buildProjectCard(
            project['title'] as String,
            project['subtitle'] as String,
            project['imagePath'] as String,
            project['color'] as Color?,
          );
        },
      ),
    );
  }

  // 3. Business Projects components
  Widget _buildBusinessProjects() {
    final businessProjects = [
      {
        'title': 'Finance & Legal',
        'subtitle': 'Websites, landing pages, mobile UI',
        'imagePath': 'assets/lasso_bg.png',
        'color': Colors.indigo[600],
      },
      {
        'title': 'Admin & Support',
        'subtitle': 'Websites, dashboards',
        'imagePath': 'assets/web_apps.png',
        'color': Colors.blue[600],
      },
      {
        'title': ' Documentation & Strategy ',
        'subtitle': 'Shopping apps, product pages',
        'imagePath': 'assets/brand_identity.png',
        'color': Colors.teal[600],
      },
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: businessProjects.length,
        itemBuilder: (context, index) {
          final project = businessProjects[index];
          return _buildProjectCard(
            project['title'] as String,
            project['subtitle'] as String,
            project['imagePath'] as String,
            project['color'] as Color?,
          );
        },
      ),
    );
  }

  // 4. YouTube Projects components
  Widget _buildYoutubeProjects() {
    final youtubeProjects = [
      {
        'title': 'Video Production',
        'subtitle': 'YouTube videos, shorts',
        'imagePath': 'assets/video_production.png',
        'color': Colors.red[700],
      },
      {
        'title': 'Channel Branding',
        'subtitle': 'Logos, thumbnails, banners',
        'imagePath': 'assets/brand_identity.png',
        'color': Colors.red[900],
      },
      {
        'title': 'Strategy & Growth',
        'subtitle': 'Analytics, optimization',
        'imagePath': 'assets/social_media.png',
        'color': Colors.red[800],
      },
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: youtubeProjects.length,
        itemBuilder: (context, index) {
          final project = youtubeProjects[index];
          return _buildProjectCard(
            project['title'] as String,
            project['subtitle'] as String,
            project['imagePath'] as String,
            project['color'] as Color?,
          );
        },
      ),
    );
  }

  // 5. Instagram Projects components
  Widget _buildInstagramProjects() {
    final instagramProjects = [
      {
        'title': 'Reels and Video',
        'subtitle': 'Grid layouts, content themes',
        'imagePath': 'assets/social_media.png',
        'color': Colors.purple[700],
      },
      {
        'title': 'Content Design',
        'subtitle': 'Interactive elements, highlights',
        'imagePath': 'assets/brand_identity.png',
        'color': Colors.purple[500],
      },
      {
        'title': 'Growth & Statergy',
        'subtitle': 'Photos, videos, reels',
        'imagePath': 'assets/video_production.png',
        'color': Colors.purple[900],
      },
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: instagramProjects.length,
        itemBuilder: (context, index) {
          final project = instagramProjects[index];
          return _buildProjectCard(
            project['title'] as String,
            project['subtitle'] as String,
            project['imagePath'] as String,
            project['color'] as Color?,
          );
        },
      ),
    );
  }

  // Common project card used for all project types
  Widget _buildProjectCard(
    String title,
    String subtitle,
    String imagePath,
    Color? color,
  ) {
    return Container(
      width: 230,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(imagePath, fit: BoxFit.cover),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page that shows the full category list (Explore page)
class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Brand Identity',
        'color': Colors.grey[200],
        'imagePath': 'assets/brand_identity.png',
      },
      {
        'name': 'Web apps',
        'color': Colors.blue[900],
        'imagePath': 'assets/web_apps.png',
      },
      {
        'name': 'Social Media',
        'color': Colors.orange[300],
        'imagePath': 'assets/social_media.png',
      },
      {
        'name': 'Video Production',
        'color': Colors.purple[400],
        'imagePath': 'assets/video_production.png',
      },
      {
        'name': 'Whatsapp ads',
        'color': Colors.green[400],
        'imagePath': 'assets/whatsapp_ads.png',
      },
      {
        'name': 'Product Design',
        'color': Colors.teal[300],
        'imagePath': 'assets/product_design.png',
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
            crossAxisCount: 2,
            childAspectRatio: 1.0,
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
          Image.asset(imagePath, fit: BoxFit.cover),
          // Gradient overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
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
        'description':
            'A startup focused on connecting freelancers with businesses.',
      },
      {
        'name': 'Fintech App',
        'backgroundImage': 'assets/web_apps.png',
        'description': 'Digital banking solution for modern finances.',
      },
      {
        'name': 'Health App',
        'backgroundImage': 'assets/video_production.png',
        'description': 'Fitness tracking platform for health enthusiasts.',
      },
      {
        'name': 'EdTech Platform',
        'backgroundImage': 'assets/brand_identity.png',
        'description': 'Educational technology for remote learning.',
      },
      {
        'name': 'Food Delivery',
        'backgroundImage': 'assets/social_media.png',
        'description': 'On-demand food delivery service for urban areas.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Projects'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: startups.length,
          itemBuilder: (context, index) {
            final startup = startups[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _buildStartupCard(
                startup['name'] as String,
                null, // logoPath
                startup['backgroundImage'] as String,
                startup['description'] as String,
              ),
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
    String description,
  ) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(backgroundImage, fit: BoxFit.cover),
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
                    Image.asset(logoPath, width: 40, height: 40),
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
                          fontSize: 14,
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
      ),
    );
  }
}

// Page for Business Projects, YouTube Projects, and Instagram Projects
class CategoryProjectsPage extends StatelessWidget {
  final String title;

  const CategoryProjectsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Populate different projects based on the category title
    final List<Map<String, dynamic>> projects;

    if (title == 'Business Projects') {
      projects = [
        {
          'title': 'Finance & Legal',
          'subtitle': 'Websites, landing pages, mobile UI',
          'imagePath': 'assets/lasso_bg.png',
          'color': Colors.indigo[600],
        },
        {
          'title': 'Admin & Support',
          'subtitle': 'Websites, dashboards',
          'imagePath': 'assets/web_apps.png',
          'color': Colors.blue[600],
        },
        {
          'title': 'E-commerce',
          'subtitle': 'Shopping apps, product pages',
          'imagePath': 'assets/brand_identity.png',
          'color': Colors.teal[600],
        },
        {
          'title': 'CRM Systems',
          'subtitle': 'Customer relationship management',
          'imagePath': 'assets/social_media.png',
          'color': Colors.blue[800],
        },
        {
          'title': 'Analytics',
          'subtitle': 'Business intelligence dashboards',
          'imagePath': 'assets/product_design.png',
          'color': Colors.indigo[800],
        },
        {
          'title': 'HR Solutions',
          'subtitle': 'Employee management systems',
          'imagePath': 'assets/whatsapp_ads.png',
          'color': Colors.teal[800],
        },
      ];
    } else if (title == 'YouTube Projects') {
      projects = [
        {
          'title': 'Video Production',
          'subtitle': 'YouTube videos, shorts',
          'imagePath': 'assets/video_production.png',
          'color': Colors.red[700],
        },
        {
          'title': 'Channel Branding',
          'subtitle': 'Logos, thumbnails, banners',
          'imagePath': 'assets/brand_identity.png',
          'color': Colors.red[900],
        },
        {
          'title': 'Content Strategy',
          'subtitle': 'Analytics, optimization',
          'imagePath': 'assets/social_media.png',
          'color': Colors.red[800],
        },
        {
          'title': 'Video Editing',
          'subtitle': 'Post-production, effects',
          'imagePath': 'assets/lasso_bg.png',
          'color': Colors.red[500],
        },
        {
          'title': 'Script Writing',
          'subtitle': 'Storyboards, narratives',
          'imagePath': 'assets/web_apps.png',
          'color': Colors.red[600],
        },
        {
          'title': 'Audience Growth',
          'subtitle': 'Subscriber acquisition tactics',
          'imagePath': 'assets/whatsapp_ads.png',
          'color': Colors.red[400],
        },
      ];
    } else {
      // Instagram Projects
      projects = [
        {
          'title': 'Feed Design',
          'subtitle': 'Grid layouts, content themes',
          'imagePath': 'assets/social_media.png',
          'color': Colors.purple[700],
        },
        {
          'title': 'Story Templates',
          'subtitle': 'Interactive elements, highlights',
          'imagePath': 'assets/brand_identity.png',
          'color': Colors.purple[500],
        },
        {
          'title': 'Content Creation',
          'subtitle': 'Photos, videos, reels',
          'imagePath': 'assets/video_production.png',
          'color': Colors.purple[900],
        },
        {
          'title': 'Influencer Campaigns',
          'subtitle': 'Partnership strategies',
          'imagePath': 'assets/lasso_bg.png',
          'color': Colors.purple[400],
        },
        {
          'title': 'Engagement Growth',
          'subtitle': 'Follower acquisition tactics',
          'imagePath': 'assets/web_apps.png',
          'color': Colors.purple[600],
        },
        {
          'title': 'Hashtag Strategy',
          'subtitle': 'Reach optimization',
          'imagePath': 'assets/whatsapp_ads.png',
          'color': Colors.purple[800],
        },
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: projects.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final project = projects[index];
            return _buildProjectCard(
              project['title'] as String,
              project['subtitle'] as String,
              project['imagePath'] as String,
              project['color'] as Color?,
            );
          },
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String subtitle,
    String imagePath,
    Color? color,
  ) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(imagePath, fit: BoxFit.cover),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
