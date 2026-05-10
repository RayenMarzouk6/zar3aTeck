'use client';

import Link from 'next/link';
import { useRouter } from 'next/navigation';
import styles from '../auth.module.css';

export default function RegisterPage() {
  const router = useRouter();

  const handleRegister = (e: React.FormEvent) => {
    e.preventDefault();
    router.push('/dashboard');
  };

  return (
    <div className={`${styles.authPage} glass-panel animate-slide-up`}>
      <div className={styles.logoArea}>
        <div className={styles.logoIcon}>Z</div>
        <h1 className={styles.title}>Join Zar3a Tech</h1>
        <p className={styles.subtitle}>Start optimizing your agricultural irrigation today</p>
      </div>

      <form className={styles.form} onSubmit={handleRegister}>
        <div className={styles.inputGroup}>
          <label className={styles.label}>Full Name</label>
          <input type="text" className={styles.input} placeholder="John Doe" />
        </div>
        <div className={styles.inputGroup}>
          <label className={styles.label}>Email Address</label>
          <input type="email" className={styles.input} placeholder="name@farm.com" />
        </div>
        <div className={styles.inputGroup}>
          <label className={styles.label}>Password</label>
          <input type="password" className={styles.input} placeholder="••••••••" />
        </div>
        <div className={styles.inputGroup}>
          <label className={styles.label}>Confirm Password</label>
          <input type="password" className={styles.input} placeholder="••••••••" />
        </div>

        <button type="submit" className={styles.button}>Create Account</button>
      </form>

      <div className={styles.footer}>
        Already have an account? 
        <Link href="/login" className={styles.link}>Sign In</Link>
      </div>
    </div>
  );
}
