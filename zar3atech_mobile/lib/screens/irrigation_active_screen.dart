import 'package:flutter/material.dart';
import 'package:zar3atech/theme/app_theme.dart';
import 'dart:async';

class IrrigationActiveScreen extends StatefulWidget {
  final String fieldName;

  const IrrigationActiveScreen({
    super.key,
    required this.fieldName,
  });

  @override
  State<IrrigationActiveScreen> createState() => _IrrigationActiveScreenState();
}

class _IrrigationActiveScreenState extends State<IrrigationActiveScreen> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  
  // Timer State
  int _secondsRemaining = 19 * 60 + 45; // 19:45
  int _volumeLiters = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    
    // Setup Pulse Animation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Setup Timer
    _startIrrigationTimer();
  }

  void _startIrrigationTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
          // For every second, dispense approx 0.38 Liters to reach ~450L total in 20 min
          _volumeLiters = ((1185 - _secondsRemaining) * 0.38).round();
        });
      } else {
        _stopIrrigation();
      }
    });
  }

  void _stopIrrigation() {
    _timer?.cancel();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("L'irrigation a été arrêtée avec succès."),
        backgroundColor: AppTheme.primary,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        backgroundColor: AppTheme.background.withValues(alpha: 0.7),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.eco, color: AppTheme.primary, size: 24),
            const SizedBox(width: 8),
            Text(
              'Zar3aTech',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              
              // Animated Graphic Area
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Ambient Glowing Blur
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primaryContainer.withValues(alpha: 0.1),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.secondaryContainer.withValues(alpha: 0.2),
                              blurRadius: 100,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      ),
                      
                      // Central White Bubble
                      Container(
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.surfaceContainerLowest,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 40,
                              offset: const Offset(0, 16),
                            ),
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.5),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Soft Gradient Overlay
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [AppTheme.primary, AppTheme.primaryContainer],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ).copyWith(
                                color: null, 
                                // Emulate opacity on the gradient
                              ),
                              foregroundDecoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.surfaceContainerLowest.withValues(alpha: 0.95),
                              ),
                            ),
                            
                            // Plant Graphic
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Icon(
                                      Icons.local_florist_rounded, // fallback for potted_plant
                                      size: 100,
                                      color: AppTheme.primary,
                                    ),
                                    
                                    // Animated Water Drop
                                    Positioned(
                                      top: -10,
                                      right: -10,
                                      child: AnimatedBuilder(
                                        animation: _pulseAnimation,
                                        builder: (context, child) {
                                          return Transform.scale(
                                            scale: _pulseAnimation.value,
                                            child: child,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.water_drop,
                                          color: AppTheme.secondary,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                
                                // Progress Dots
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildDot(0.2),
                                    _buildDot(0.4),
                                    _buildDot(0.6),
                                  ],
                                ),
                              ],
                            ),
                            
                            // Bottom ACTIF Label
                            Positioned(
                              bottom: 24,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [AppTheme.primary, AppTheme.primaryContainer],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primary.withValues(alpha: 0.3),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                ),
                                child: Text(
                                  'ACTIF',
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Status Text
              Text(
                'Irrigation en cours...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Secteur Alpha - ${widget.fieldName}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
              ),
              const Spacer(),

              // Timer & Volume Cards
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.timer_rounded, color: AppTheme.primary),
                          const SizedBox(height: 8),
                          Text(
                            'TEMPS RESTANT',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppTheme.onSurfaceVariant,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatTime(_secondsRemaining),
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppTheme.onSurface,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.water_drop, color: AppTheme.secondary),
                          const SizedBox(height: 8),
                          Text(
                            'VOLUME ESTIMÉ',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppTheme.onSurfaceVariant,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$_volumeLiters L',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppTheme.onSurface,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Stop Button
              ElevatedButton(
                onPressed: _stopIrrigation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.errorContainer,
                  foregroundColor: AppTheme.onErrorContainer,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.stop_circle_rounded),
                    const SizedBox(width: 8),
                    Text(
                      "ARRÊTER L'IRRIGATION",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
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

  Widget _buildDot(double alpha) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppTheme.primary.withValues(alpha: alpha),
        shape: BoxShape.circle,
      ),
    );
  }
}
