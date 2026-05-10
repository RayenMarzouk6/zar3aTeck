export default function BodyPage() {
  return (
    <div className="animate-fade-in" style={{ display: 'flex', flexDirection: 'column', gap: '2rem' }}>
      <header>
        <h1 style={{ fontSize: '2rem', fontFamily: 'var(--font-heading)' }}>System Settings</h1>
        <p style={{ color: 'var(--color-text-muted)' }}>Configure your Zar3a Tech hardware and platform preferences.</p>
      </header>

      <div className="glass-panel" style={{ padding: '2rem', display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
        <section>
          <h2 style={{ fontSize: '1.25rem', marginBottom: '1rem' }}>General Configuration</h2>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '1.5rem' }}>
            <div className="glass-panel" style={{ padding: '1.5rem', background: 'var(--color-bg-glass)' }}>
              <h3 style={{ fontSize: '1rem', marginBottom: '0.5rem' }}>Irrigation Logic</h3>
              <p style={{ fontSize: '0.875rem', color: 'var(--color-text-muted)', marginBottom: '1rem' }}>Smart scheduling based on AI weather prediction.</p>
              <div style={{ width: '40px', height: '20px', background: 'var(--color-primary)', borderRadius: '20px', position: 'relative' }}>
                <div style={{ width: '16px', height: '16px', background: 'white', borderRadius: '50%', position: 'absolute', right: '2px', top: '2px' }} />
              </div>
            </div>
            <div className="glass-panel" style={{ padding: '1.5rem', background: 'var(--color-bg-glass)' }}>
              <h3 style={{ fontSize: '1rem', marginBottom: '0.5rem' }}>Notification Thresholds</h3>
              <p style={{ fontSize: '0.875rem', color: 'var(--color-text-muted)', marginBottom: '1rem' }}>Notify when moisture drops below 30%.</p>
              <input type="range" style={{ width: '100%', accentColor: 'var(--color-primary)' }} defaultValue="30" />
            </div>
          </div>
        </section>

        <section>
          <h2 style={{ fontSize: '1.25rem', marginBottom: '1rem' }}>Connected Devices</h2>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
            {['Master Valve - MV01', 'Moisture Sensor - S02', 'Weather Station - WS01'].map((device) => (
              <div key={device} className="glass-panel" style={{ padding: '1rem', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <span>{device}</span>
                <span style={{ fontSize: '0.75rem', color: 'var(--color-primary)' }}>Connected</span>
              </div>
            ))}
          </div>
        </section>
      </div>
    </div>
  );
}
