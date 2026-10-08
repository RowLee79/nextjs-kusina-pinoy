CREATE TABLE `menu` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`description` text NOT NULL,
	`category` text NOT NULL,
	`price_cents` integer NOT NULL,
	`image_key` text NOT NULL,
	`available` integer DEFAULT 1 NOT NULL,
	`featured` integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `menu_name_uq` ON `menu` (`name`);--> statement-breakpoint
CREATE TABLE `order_items` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`order_id` integer NOT NULL,
	`menu_id` integer NOT NULL,
	`name` text NOT NULL,
	`price_cents` integer NOT NULL,
	`quantity` integer NOT NULL,
	`line_cents` integer NOT NULL,
	FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`menu_id`) REFERENCES `menu`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE INDEX `order_items_order_idx` ON `order_items` (`order_id`);--> statement-breakpoint
CREATE TABLE `orders` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`reference` text NOT NULL,
	`customer_name` text NOT NULL,
	`phone` text NOT NULL,
	`email` text DEFAULT '' NOT NULL,
	`address` text DEFAULT '' NOT NULL,
	`fulfillment` text NOT NULL,
	`payment_method` text NOT NULL,
	`status` text DEFAULT 'Placed' NOT NULL,
	`subtotal_cents` integer NOT NULL,
	`delivery_cents` integer NOT NULL,
	`total_cents` integer NOT NULL,
	`notes` text DEFAULT '' NOT NULL,
	`created_at` text NOT NULL,
	`completed_at` text
);
--> statement-breakpoint
CREATE UNIQUE INDEX `orders_ref_uq` ON `orders` (`reference`);--> statement-breakpoint
CREATE INDEX `orders_status_idx` ON `orders` (`status`);--> statement-breakpoint
CREATE INDEX `orders_phone_idx` ON `orders` (`phone`);