import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Kusina Pinoy | Filipino Food Delivery",
  description: "Your favorite Filipino comfort food, delivered fresh.",
  other: {
    "codex-preview": "development",
  },
  icons: {
    icon: "/favicon.svg",
    shortcut: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
