CREATE TABLE IF NOT EXISTS "Users" (
	"id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
	"keycloak_id" uuid NOT NULL UNIQUE,
	"email" text NOT NULL UNIQUE,
	"full_name" text NOT NULL,
	"created_at" timestamp with time zone NOT NULL,
	"additional_info" jsonb,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Roles" (
	"role_id" bigint GENERATED ALWAYS AS IDENTITY NOT NULL UNIQUE,
	"role_name" text NOT NULL UNIQUE,
	PRIMARY KEY ("role_id")
);

CREATE TABLE IF NOT EXISTS "UserRoles" (
    "user_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    PRIMARY KEY ("user_id", "role_id")
);



ALTER TABLE "UserRoles" ADD CONSTRAINT "UserRoles_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE CASCADE;

ALTER TABLE "UserRoles" ADD CONSTRAINT "UserRoles_fk1" FOREIGN KEY ("role_id") REFERENCES "Roles"("role_id") ON DELETE CASCADE;
