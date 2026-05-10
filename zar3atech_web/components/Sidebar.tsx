'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import styles from './Sidebar.module.css';

const navItems = [
  { name: 'Overview', path: '/dashboard', icon: '📊' },
  { name: 'Field Analytics', path: '/analytics', icon: '📈' },
  { name: 'Alerts Dashboard', path: '/alerts', icon: '⚠️' },
  { name: 'Settings', path: '/body', icon: '⚙️' },
];

export default function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className={`${styles.sidebar} glass-panel animate-fade-in`}>
      <Link href="/" className={styles.logo}>
        <div className={styles.logoIcon}>Z</div>
        Zar3a Tech
      </Link>

      <nav className={styles.nav}>
        {navItems.map((item, index) => {
          const isActive = pathname === item.path;
          return (
            <Link
              key={item.path}
              href={item.path}
              className={`${styles.navLink} ${isActive ? styles.navLinkActive : ''} delay-${(index + 1) * 100} animate-slide-up`}
              style={{ animationFillMode: 'both' }}
            >
              <span>{item.icon}</span>
              {item.name}
            </Link>
          );
        })}
      </nav>

      <div className={styles.userProfile}>
        <div className={styles.avatar}>A</div>
        <div className={styles.userInfo}>
          <span className={styles.userName}>Admin User</span>
          <span className={styles.userRole}>Farm Manager</span>
        </div>
      </div>
    </aside>
  );
}
