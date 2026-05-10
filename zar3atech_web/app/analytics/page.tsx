import styles from "./Analytics.module.css";

const weeklyData = [
  { day: 'Mon', value: 45 },
  { day: 'Tue', value: 52 },
  { day: 'Wed', value: 38 },
  { day: 'Thu', value: 65 },
  { day: 'Fri', value: 48 },
  { day: 'Sat', value: 30 },
  { day: 'Sun', value: 40 },
];

export default function AnalyticsPage() {
  return (
    <div className={`${styles.container} animate-fade-in`}>
      <header>
        <h1 style={{ fontSize: '2rem', fontFamily: 'var(--font-heading)' }}>Field Analytics</h1>
        <p style={{ color: 'var(--color-text-muted)' }}>Historical data and sensor performance across all zones.</p>
      </header>

      <section className="glass-panel" style={{ padding: '2rem' }}>
        <h2 style={{ fontSize: '1.25rem', marginBottom: '1.5rem' }}>Water Consumption (Weekly)</h2>
        <div className={styles.chartContainer}>
          {weeklyData.map((data, index) => (
            <div key={data.day} className={styles.barWrapper}>
              <div 
                className={`${styles.bar} animate-slide-up`} 
                style={{ height: `${data.value * 5}px`, animationDelay: `${(index + 1) * 100}ms`, animationFillMode: 'both' }}
              >
                <span className={styles.barValue}>{data.value}L</span>
              </div>
              <span className={styles.barLabel}>{data.day}</span>
            </div>
          ))}
        </div>
      </section>

      <div className={styles.analyticsGrid}>
        <div className={`${styles.sensorCard} glass-panel animate-slide-up delay-100`}>
          <div className={styles.sensorIcon}>🌡️</div>
          <div>
            <h3 style={{ fontSize: '1rem' }}>Ambient Temperature</h3>
            <p style={{ fontSize: '1.5rem', fontWeight: '700' }}>24.5°C</p>
            <p style={{ fontSize: '0.75rem', color: 'var(--color-primary)' }}>Stable</p>
          </div>
        </div>
        <div className={`${styles.sensorCard} glass-panel animate-slide-up delay-200`}>
          <div className={styles.sensorIcon}>💧</div>
          <div>
            <h3 style={{ fontSize: '1rem' }}>Soil pH Level</h3>
            <p style={{ fontSize: '1.5rem', fontWeight: '700' }}>6.8 pH</p>
            <p style={{ fontSize: '0.75rem', color: 'var(--color-primary)' }}>Ideal Range</p>
          </div>
        </div>
        <div className={`${styles.sensorCard} glass-panel animate-slide-up delay-300`}>
          <div className={styles.sensorIcon}>☀️</div>
          <div>
            <h3 style={{ fontSize: '1rem' }}>Light Intensity</h3>
            <p style={{ fontSize: '1.5rem', fontWeight: '700' }}>850 lx</p>
            <p style={{ fontSize: '0.75rem', color: 'var(--color-accent)' }}>High Absorption</p>
          </div>
        </div>
        <div className={`${styles.sensorCard} glass-panel animate-slide-up delay-400`}>
          <div className={styles.sensorIcon}>💨</div>
          <div>
            <h3 style={{ fontSize: '1rem' }}>CO2 Concentration</h3>
            <p style={{ fontSize: '1.5rem', fontWeight: '700' }}>410 ppm</p>
            <p style={{ fontSize: '0.75rem', color: 'var(--color-primary)' }}>Normal</p>
          </div>
        </div>
      </div>
    </div>
  );
}
