CREATE TABLE "members" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL
);

CREATE TABLE "regions" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL
);

CREATE TABLE "stores" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "region_id" INTEGER NOT NULL,
  "name" TEXT NOT NULL,
  "address" TEXT NOT NULL,
  CONSTRAINT "stores_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "regions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE "reviews" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "store_id" INTEGER NOT NULL,
  "member_id" INTEGER NOT NULL,
  "rating" INTEGER NOT NULL,
  "content" TEXT NOT NULL,
  "created_at" TEXT NOT NULL,
  CONSTRAINT "reviews_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "stores" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT "reviews_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "members" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE "missions" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "store_id" INTEGER NOT NULL,
  "title" TEXT NOT NULL,
  "reward" INTEGER NOT NULL,
  "deadline" TEXT NOT NULL,
  "created_at" TEXT NOT NULL,
  CONSTRAINT "missions_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "stores" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE "member_missions" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "member_id" INTEGER NOT NULL,
  "mission_id" INTEGER NOT NULL,
  "status" TEXT NOT NULL,
  "challenged_at" TEXT NOT NULL,
  CONSTRAINT "member_missions_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "members" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT "member_missions_mission_id_fkey" FOREIGN KEY ("mission_id") REFERENCES "missions" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
