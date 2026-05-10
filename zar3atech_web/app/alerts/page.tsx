import styles from "./Alerts.module.css";

const alerts = [
  { id: 1, title: 'Critical Low Moisture - Zone 2', time: '12 mins ago', level: 'critical', icon: '🚨' },
  { id: 2, title: 'Sensor Disconnected - Zone 4', time: '45 mins ago', level: 'warning', icon: '📡' },
  { id: 3, title: 'Scheduled Maintenance', time: '2 hours ago', level: 'info', icon: '🛠️' },
  { id: 4, title: 'Water Pressure Drop', time: '5 hours ago', level: 'warning', icon: '📉' },
];

export default function AlertsPage() {
  return (
    <div className={`${styles.container} animate-fade-in`}>
      <header>
        <h1 style={{ fontSize: '2rem', fontFamily: 'var(--font-heading)' }}>Security & Alerts</h1>
        <p style={{ color: 'var(--color-text-muted)' }}>Real-time monitoring of your irrigation system health.</p>
      </header>

      <section className={styles.alertList}>
        {alerts.map((alert, index) => (
          <div 
            key={alert.id} 
            className={`${styles.alertCard} glass-panel animate-slide-up`}
            style={{ animationDelay: `${(index + 1) * 100}ms`, animationFillMode: 'both' }}
          >
            <div className={`${styles.alertStatus} ${
              alert.level === 'critical' ? styles.statusCritical : 
              alert.level === 'warning' ? styles.statusWarning : 
              styles.statusInfo
            }`} />
            <div className={styles.alertIcon}>{alert.icon}</div>
            <div className={styles.alertContent}>
              <h3 className={styles.alertTitle}>{alert.title}</h3>
              <span className={styles.alertTime}>{alert.time}</span>
            </div>
            <button className={styles.actionButton}>Resolve</button>
          </div>
        ))}
      </section>
    </div>
  );
}
