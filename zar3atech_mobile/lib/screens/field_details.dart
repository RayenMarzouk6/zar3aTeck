import 'package:flutter/material.dart';
import 'package:zar3atech/theme/app_theme.dart';
import 'package:zar3atech/screens/irrigation_active_screen.dart';

class FieldDetails extends StatelessWidget {
  const FieldDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        backgroundColor: AppTheme.surface.withOpacity(0.7),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Détails du champ',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.local_florist, color: AppTheme.primary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 100, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFieldHeader(context),
            const SizedBox(height: 32),
            _buildMoistureGraph(context),
            const SizedBox(height: 32),
            _buildAIInsight(context),
            const SizedBox(height: 32),
            _buildHistory(context),
            const SizedBox(height: 48),
            _buildPrimaryCTA(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SECTEUR ALPHA',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.primary.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'North Vineyards',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24),
          Row(
            spacing: 16,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryFixed,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.water_drop, size: 16, color: AppTheme.onPrimaryFixed),
                    const SizedBox(width: 8),
                    Text(
                      'Humidité : 42%',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppTheme.onPrimaryFixed,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.thermostat, size: 16, color: AppTheme.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text(
                      '24°C',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppTheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoistureGraph(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tendances d'humidité",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Dernières 24 heures',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppTheme.outlineVariant,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Expanded(
                child: CustomPaint(
                  size: const Size(double.infinity, double.infinity),
                  painter: _GraphPainter(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  '08:00',
                  '12:00',
                  '16:00',
                  '20:00',
                  '00:00',
                  '04:00'
                ]
                    .map((time) => Text(
                          time,
                          style: const TextStyle(fontSize: 10, color: AppTheme.outlineVariant, fontWeight: FontWeight.bold),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAIInsight(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primary, AppTheme.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -32,
            right: -32,
            child: Icon(
              Icons.query_stats,
              size: 160,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome, color: AppTheme.secondaryFixed),
                  const SizedBox(width: 8),
                  Text(
                    'INTELLIGENCE IA',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppTheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.white, height: 1.5),
                  children: [
                    TextSpan(text: 'Recommandation IA : '),
                    TextSpan(
                      text: "Démarrer l'irrigation à 20h00",
                      style: TextStyle(color: AppTheme.secondaryFixed, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' pendant 20 minutes. Le taux d\'évaporation actuel est élevé en raison de la faible humidité.'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Historique d'irrigation",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              _buildHistoryItem(
                title: 'Il y a 2 jours',
                subtitle: "Forçage d'urgence",
                duration: '30 min',
                isLast: false,
                isPrimary: true,
              ),
              const SizedBox(height: 16),
              _buildHistoryItem(
                title: 'Il y a 4 jours', // Changed to make sense compared to above
                subtitle: 'Cycle Automatique', // Changed to be realistic
                duration: '15 min',
                isLast: true,
                isPrimary: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem({
    required String title,
    required String subtitle,
    required String duration,
    required bool isLast,
    required bool isPrimary,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isPrimary ? AppTheme.primary : AppTheme.outlineVariant,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: AppTheme.surfaceContainerHigh,
              ),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.onSurface),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: AppTheme.outlineVariant),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            duration,
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryCTA(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          colors: [AppTheme.primary, AppTheme.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.3),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IrrigationActiveScreen(fieldName: 'North Vineyards'),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.play_circle, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                Text(
                  "Démarrer l'irrigation",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [AppTheme.primary, AppTheme.secondaryFixed],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.125, size.height * 0.2, size.width * 0.25, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.3, size.width * 0.75, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.1, size.width, size.height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
