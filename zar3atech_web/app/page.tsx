import { redirect } from 'next/navigation';

export default function RootPage() {
  // Prototype logic: always start at login
  redirect('/login');
}
