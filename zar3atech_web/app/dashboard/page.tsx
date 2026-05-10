'use client';

import { useState, useEffect } from "react";
import styles from "./Dashboard.module.css";

export default function Home() {
  const [isIrrigating, setIsIrrigating] = useState(false);
  const [moisture, setMoisture] = useState(68);

  // Simulate moisture increasing during irrigation
  useEffect(() => {
    let interval: NodeJS.Timeout;
    if (isIrrigating) {
      interval = setInterval(() => {
        setMoisture(prev => Math.min(prev + 1, 100));
      }, 3000);
    }
    return () => clearInterval(interval);
  }, [isIrrigating]);

  return (
    <div className={`${styles.container} animate-fade-in`}>
      <header className={styles.header}>
        <div>
          <h1 className={styles.title}>Dashboard Overview</h1>
          <p className={styles.subtitle}>Welcome back, here's what's happening in your fields.</p>
        </div>
        <div className="glass-panel" style={{ padding: '0.5rem 1rem', display: 'flex', alignItems: 'center', gap: '1rem' }}>
          <span className={isIrrigating ? "animate-pulse-soft" : ""} style={{ color: 'var(--color-primary)' }}>●</span> 
          {isIrrigating ? "Irrigation in Progress" : "System Standby"}
        </div>
      </header>

      <section className={styles.statsGrid}>
        <div className={`${styles.statCard} glass-panel animate-slide-up delay-100`}>
          <span className={styles.statLabel}>Total Soil Moisture</span>
          <span className={`${styles.statValue} ${isIrrigating ? "animate-pulse-soft" : ""}`} style={{ color: 'var(--color-secondary)' }}>{moisture}%</span>
          <span className={`${styles.statTrend} ${styles.trendUp}`}>+2% from yesterday</span>
        </div>
        <div className={`${styles.statCard} glass-panel animate-slide-up delay-200`}>
          <span className={styles.statLabel}>Water Usage</span>
          <span className={styles.statValue}>1,240 L</span>
          <span className={`${styles.statTrend} ${styles.trendDown}`}>-14% from last week</span>
        </div>
        <div className={`${styles.statCard} glass-panel animate-slide-up delay-300`}>
          <span className={styles.statLabel}>Active Zones</span>
          <span className={styles.statValue}>{isIrrigating ? "6 / 6" : "4 / 6"}</span>
          <span className={styles.statTrend} style={{ background: 'rgba(0, 0, 0, 0.03)', color: 'var(--color-text-muted)' }}>
            {isIrrigating ? "All valves open" : "Running normally"}
          </span>
        </div>
      </section>

      <div className={styles.mainGrid}>
        <section className={`${styles.panel} glass-panel animate-slide-up delay-100`}>
          <h2 className={styles.panelTitle}>Irrigation Status</h2>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '300px' }}>
            <div className={`${styles.moistureCircle} ${isIrrigating ? "animate-float" : ""}`}>
              <span className={styles.moistureValue}>{moisture}%</span>
              <span style={{ fontSize: '0.875rem', color: 'var(--color-text-muted)' }}>Avg. Moisture</span>
              <div style={{ 
                position: 'absolute', 
                width: '100%', 
                height: '100%', 
                borderRadius: '50%', 
                border: '10px solid var(--color-secondary)', 
                borderTopColor: 'transparent',
                borderLeftColor: 'transparent',
                transform: `rotate(${moisture * 3.6}deg)`,
                transition: 'transform 1s ease-out'
              }}></div>
            </div>
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem', marginTop: '1.5rem' }}>
            <div className="glass-panel" style={{ padding: '1rem', textAlign: 'center' }}>
              <p style={{ fontSize: '0.75rem', color: 'var(--color-text-muted)' }}>Next Cycle</p>
              <p style={{ fontWeight: '600' }}>{isIrrigating ? "Running Now" : "06:30 PM Today"}</p>
            </div>
            <button 
              onClick={() => setIsIrrigating(!isIrrigating)}
              className="glass-panel" 
              style={{ 
                padding: '1rem', 
                textAlign: 'center', 
                border: '2px solid var(--color-primary)',
                background: isIrrigating ? 'var(--color-primary)' : 'transparent',
                color: isIrrigating ? 'white' : 'var(--color-primary)',
                cursor: 'pointer',
                fontWeight: '700',
                transition: 'all 0.3s cubic-bezier(0.16, 1, 0.3, 1)'
              }}
            >
              <p style={{ fontSize: '0.75rem', opacity: 0.8 }}>Action</p>
              <p>{isIrrigating ? "Stop System" : "Manual Start"}</p>
            </button>
          </div>
        </section>

        <section className={`${styles.panel} glass-panel animate-slide-up delay-200`}>
          <h2 className={styles.panelTitle}>Local Weather</h2>
          <div className={styles.weatherCard}>
            <div className={styles.weatherInfo}>
              <span className="animate-float" style={{ fontSize: '3rem' }}>☀️</span>
              <span className={styles.weatherTemp}>28°C</span>
            </div>
            <p style={{ fontWeight: '500' }}>Sunny, Clear Skies</p>
            <hr style={{ opacity: 0.1, margin: '1rem 0' }} />
            <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '0.875rem' }}>
                <span style={{ color: 'var(--color-text-muted)' }}>Humidity</span>
                <span>42%</span>
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '0.875rem' }}>
                <span style={{ color: 'var(--color-text-muted)' }}>Wind Speed</span>
                <span>12 km/h</span>
              </div>
            </div>
            <button className="glass-panel animate-shimmer" style={{ 
              marginTop: '1.5rem', 
              padding: '1rem', 
              width: '100%', 
              background: 'var(--color-primary)', 
              color: 'white', 
              border: 'none',
              fontWeight: '600',
              cursor: 'pointer',
              transition: 'transform 0.2s ease'
            }}>
              Adjust Irrigation for Heat
            </button>
          </div>
        </section>
      </div>
    </div>
  );
}
