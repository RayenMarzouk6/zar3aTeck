'use client';

import Link from 'next/link';
import { useRouter } from 'next/navigation';
import styles from '../auth.module.css';

export default function LoginPage() {
  const router = useRouter();

  const handleSignIn = (e: React.FormEvent) => {
    e.preventDefault();
    router.push('/dashboard');
  };

  return (
    <div className={`${styles.authPage} glass-panel animate-slide-up`}>
      <div className={styles.logoArea}>
        <div className={styles.logoIcon}>Z</div>
        <h1 className={styles.title}>Welcome Back</h1>
        <p className={styles.subtitle}>Enter your credentials to access your dashboard</p>
      </div>

      <form className={styles.form} onSubmit={handleSignIn}>
        <div className={styles.inputGroup}>
          <label className={styles.label}>Email Address</label>
          <input type="email" className={styles.input} placeholder="name@farm.com" />
        </div>
        <div className={styles.inputGroup}>
          <label className={styles.label}>Password</label>
          <input type="password" className={styles.input} placeholder="••••••••" />
        </div>

        <div className={styles.checkboxGroup}>
          <input type="checkbox" id="remember" className={styles.checkbox} />
          <label htmlFor="remember">Remember this device</label>
        </div>

        <button type="submit" className={styles.button}>Sign In</button>
      </form>

      <div className={styles.footer}>
        Don't have an account? 
        <Link href="/register" className={styles.link}>Create Account</Link>
      </div>
    </div>
  );
}
