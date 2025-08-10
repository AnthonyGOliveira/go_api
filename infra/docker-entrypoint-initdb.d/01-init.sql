-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ==========================
-- Users table
-- ==========================
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Trigger function to auto-update updated_at
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_set_updated_at ON users;
CREATE TRIGGER trigger_set_updated_at
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- ==========================
-- Seed data
-- ==========================
INSERT INTO users (id, name, email) VALUES
(uuid_generate_v4(), 'Alice Santos', 'alice@example.com'),
(uuid_generate_v4(), 'Bruno Oliveira', 'bruno@example.com'),
(uuid_generate_v4(), 'Carla Mendes', 'carla@example.com')
ON CONFLICT (email) DO NOTHING;