import 'package:flutter/material.dart';
import 'package:zar3atech/theme/app_theme.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 80, bottom: 100, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          const SizedBox(height: 32),
          _buildStatsOverview(context),
          const SizedBox(height: 32),
          _buildFilterPills(context),
          const SizedBox(height: 24),
          _buildCriticalAlertCard(context),
          const SizedBox(height: 16),
          _buildWarningAlertCard(context),
          const SizedBox(height: 16),
          _buildInfoAlertCard(context),
          const SizedBox(height: 24),
          _buildMiniAlertCards(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alertes',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          "Surveillance en temps réel et détection d'anomalies pour votre réseau d'irrigation de précision. Gérez les seuils critiques et la santé du système.",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.onSurface.withOpacity(0.8),
              ),
        ),
      ],
    );
  }

  Widget _buildStatsOverview(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                title: 'NIVEAUX CRITIQUES',
                titleColor: AppTheme.errorContainer,
                value: '01',
                subtitle: 'Systèmes approchant des seuils',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                context,
                title: 'AVERTISSEMENTS',
                titleColor: AppTheme.secondary,
                value: '04',
                subtitle: 'Systèmes approchant des seuils',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
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
                'NŒUDS SAINS',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                '98%',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Temps de fonctionnement opérationnel par secteur',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.outlineVariant,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, {
    required String title,
    required Color titleColor,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
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
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.outlineVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPills(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildPill(context, 'Toutes les alertes', isSelected: true),
          const SizedBox(width: 8),
          _buildPill(context, 'Critique'),
          const SizedBox(width: 8),
          _buildPill(context, 'Avertissement'),
          const SizedBox(width: 8),
          _buildPill(context, 'Maintenance'),
        ],
      ),
    );
  }

  Widget _buildPill(BuildContext context, String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : AppTheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isSelected ? Colors.white : AppTheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildCriticalAlertCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: const Border(left: BorderSide(color: AppTheme.statusCritical, width: 6)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 8)),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.warning, color: AppTheme.onErrorContainer),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.errorContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('ALERTE CRITIQUE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onErrorContainer)),
                    ),
                    Text('Il y a 2 minutes', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppTheme.outlineVariant)),
                  ],
                ),
                const SizedBox(height: 12),
                Text("Le taux d'humidité à South Pasture est tombé à 10%", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Action urgente requise. Le capteur ID: SP-449 signale un stress hydrique critique. L'activation automatique de la vanne a échoué.", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.onSurface.withOpacity(0.7))),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.white),
                      onPressed: () {},
                      child: const Text('Forcer la vanne'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Ignorer', style: TextStyle(color: AppTheme.onSurface)),
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

  Widget _buildWarningAlertCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: const Border(left: BorderSide(color: AppTheme.secondary, width: 6)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 8)),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.thermostat, color: AppTheme.secondary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('ALERTE MÉTÉO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.secondary)),
                    ),
                    Text('Il y a 4 heures', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppTheme.outlineVariant)),
                  ],
                ),
                const SizedBox(height: 12),
                Text("La canicule prévue mardi pourrait augmenter le taux d'évaporation de 20%", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Le système suggère un cycle d'arrosage profond préventif pour tous les secteurs de North Vineyard à partir de lundi 22:00.", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.onSurface.withOpacity(0.7))),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppTheme.secondary, foregroundColor: Colors.white),
                      onPressed: () {},
                      child: const Text('Ajuster le calendrier', style: TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Détails', style: TextStyle(color: AppTheme.onSurface, fontSize: 12)),
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

  Widget _buildInfoAlertCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: const Border(left: BorderSide(color: AppTheme.primaryFixed, width: 6)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 8)),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.settings_input_component, color: AppTheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryFixed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('INFO SYSTÈME', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onPrimaryFixed)),
                    ),
                    Text('Hier, 14:30', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppTheme.outlineVariant)),
                  ],
                ),
                const SizedBox(height: 12),
                Text("Maintenance planifiée terminée pour la pompe de North Vineyard", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Pression de l'unité de pompage P-88 rétablie à 4,2 bar. Tous les tests de diagnostic ont réussi. Reprise des opérations normales.", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.onSurface.withOpacity(0.7))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniAlertCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.battery_alert, size: 16, color: AppTheme.onSurface),
                    ),
                    Text('SENSOR NV-12', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppTheme.outlineVariant, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                Text('Avertissement batterie faible', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('La batterie du capteur périphérique NV-12 est à 8%.', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.outlineVariant)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.cloud_sync, size: 16, color: AppTheme.onSurface),
                    ),
                    Text('NETWORK', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppTheme.outlineVariant, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                Text('Synchronisation de la passerelle', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text("La passerelle s'est synchronisée à 06:00 UTC.", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.outlineVariant)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
