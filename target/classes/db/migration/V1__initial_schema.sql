CREATE EXTENSION IF NOT EXISTS vector;
CREATE TABLE articles (
  id BIGSERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  company VARCHAR(255),
  source_url TEXT NOT NULL UNIQUE,
  published_at TIMESTAMP,
  content TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE chunks (
    id BIGSERIAL PRIMARY KEY,
    article_id BIGINT NOT NULL
        REFERENCES articles(id)
            ON DELETE CASCADE,
    chunk_index INTEGER NOT NULL,
    content TEXT NOT NULL,
    embedding VECTOR(1536),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(article_id, chunk_index)
);