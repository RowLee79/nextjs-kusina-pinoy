# Kusina Pinoy — Filipino Food Online Ordering

A Next.js storefront and kitchen operations demo backed by Cloudflare D1. Includes eight Filipino sample dishes, category filtering, shopping cart, delivery or pickup checkout, server-side price calculation, order tracking by reference and phone, a kitchen status board, and menu availability management. Prices are PHP stored as integer centavos.

## Run locally

1. Install Node.js 22.13 or newer.
2. Extract this archive and enter the `kusina-ordering` directory.
3. Run `npm ci` and then `npm run dev`. Open the local URL displayed.
4. Open **Manage Menu** and choose **Load sample menu**. This inserts eight dishes on an empty database.
5. Add dishes to the cart. At checkout, enter customer and delivery or pickup details. The server recalculates totals from the current menu. Orders over ₱1,000 have free delivery; otherwise the delivery fee is ₱79.
6. Keep the `KP-...` reference and phone number. Use **Track Order** to view status. In **Kitchen Board**, advance the order through Placed → Confirmed → Preparing → Ready → Out for delivery → Completed, or directly from Ready to Completed for pickup.

This package includes the D1 migration `drizzle/0000_productive_peter_quill.sql` and a `DB` database binding in `.openai/hosting.json`. The local Workers runtime uses a local D1 database. When changing `db/schema.ts`, run `npm run db:generate` and apply the migration. To deploy outside the included Sites setup, configure a D1 binding and adapt the deployment scripts.

## Validation

`npx tsc --noEmit` type checks the app. `npm run build` builds the Workers-compatible app.

## Before public or production use

This is a functional demo. Add customer and staff authentication, role permissions, order notifications, service-area/delivery-zone checks, tax/receipt policies, anti-abuse controls, and privacy protections before public exposure. Payment method selections record payment due at handoff; no online payment provider is connected. The kitchen and menu management views have no staff authentication. Orders remain stored in D1 and have no automated fulfillment, inventory deductions, refund processing or courier dispatch.
