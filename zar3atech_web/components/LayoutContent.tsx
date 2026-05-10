'use client';

import { usePathname } from 'next/navigation';
import Sidebar from './Sidebar';
import styles from './MainLayout.module.css';

export default function LayoutContent({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const isAuthPage = pathname === '/login' || pathname === '/register';

  if (isAuthPage) {
    return (
      <main className="animate-fade-in" style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyItems: 'center' }}>
        {children}
      </main>
    );
  }

  return (
    <div className={styles.mainContainer}>
      <Sidebar />
      <main className={styles.contentWrapper}>
        {children}
      </main>
    </div>
  );
}
