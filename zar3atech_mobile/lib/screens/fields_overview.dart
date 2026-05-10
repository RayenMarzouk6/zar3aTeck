import 'package:flutter/material.dart';
import 'package:zar3atech/theme/app_theme.dart';
import 'package:zar3atech/screens/field_details.dart';

class FieldsOverview extends StatelessWidget {
  const FieldsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 80, bottom: 100, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          const SizedBox(height: 32),
          _buildFieldCard(
            context: context,
            imageUrl: 'https://media.istockphoto.com/id/675227356/photo/olive-grove-side.jpg?s=170667a&w=0&k=20&c=6tbfdCk0Wp5yHNY65NtbGl3XrPJx5FvffkicULKCqzk=',
            status: 'Sain',
            statusColor: AppTheme.statusHealthy,
            onStatusColor: AppTheme.onStatusHealthy,
            name: 'Sidi Bouzid Farm',
            type: 'Oliveraie',
            icon: Icons.wine_bar,
            humidityPercent: 72,
            humidityColor: AppTheme.primary,
          ),
          const SizedBox(height: 24),
          _buildFieldCard(
            context: context,
            imageUrl: 'https://delivery.bunningscontenthub.bunnings.com.au/api/public/content/432ab3883c1348eb8266109a25147431?v=a16b605d',
            status: 'Avertissement',
            statusColor: AppTheme.statusWarning.withOpacity(0.2),
            onStatusColor: AppTheme.onStatusWarning,
            name: 'Cap Bon Fields',
            type: 'Apples (Honeycrisp)',
            icon: Icons.eco,
            humidityPercent: 45,
            humidityColor: AppTheme.statusWarning,
          ),
          const SizedBox(height: 24),
          _buildFieldCard(
            context: context,
            imageUrl: 'https://i.pinimg.com/originals/57/2b/cf/572bcf7872d484fe059f930519b474cf.jpg',
            status: 'Critique',
            statusColor: AppTheme.statusCritical,
            onStatusColor: AppTheme.onStatusCritical,
            name: 'Béja Orchard',
            type: 'Corn (Hybrid F1)',
            icon: Icons.agriculture,
            humidityPercent: 12,
            humidityColor: Colors.red,
          ),
          const SizedBox(height: 48),
          _buildSystemStats(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'APERÇU OPÉRATIONNEL',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppTheme.outlineVariant,
                        letterSpacing: 2,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Secteurs Actifs',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.onSurface,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text('New Field'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Analyse d'hydratation en temps réel et suivi de la vitalité des cultures sur vos trois zones principales.",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.onSurface.withOpacity(0.8),
              ),
        ),
      ],
    );
  }

  Widget _buildFieldCard({
    required BuildContext context,
    required String imageUrl,
    required String status,
    required Color statusColor,
    required Color onStatusColor,
    required String name,
    required String type,
    required IconData icon,
    required int humidityPercent,
    required Color humidityColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FieldDetails()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Header
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    child: Image.network(
                      imageUrl,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 160,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image, size: 48, color: Colors.grey),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: onStatusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            status.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: onStatusColor,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(icon, size: 16, color: AppTheme.outlineVariant),
                        const SizedBox(width: 4),
                        Text(
                          type,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.outlineVariant,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "INDICE D'HUMIDITÉ",
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: AppTheme.outlineVariant,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                              ),
                              Text(
                                '$humidityPercent%',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      color: humidityColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: CircularProgressIndicator(
                                  value: humidityPercent / 100,
                                  strokeWidth: 4,
                                  backgroundColor: humidityColor.withOpacity(0.2),
                                  color: humidityColor,
                                ),
                              ),
                              Icon(
                                humidityPercent > 50 ? Icons.water_drop : Icons.warning_amber,
                                color: humidityColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSystemStats(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Santé de l'irrigation",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Efficacité hydrique globale.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '94',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Text(
                        '/100',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.opacity, color: Colors.white10, size: 100),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PROCHAIN CYCLE',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppTheme.outlineVariant,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'AUTO',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.schedule, color: AppTheme.primary),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '04:30 AM',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppTheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Durée estimée: 1h 15m',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.outlineVariant,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
